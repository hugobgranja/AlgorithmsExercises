//
//  DesignTwitterBST.swift
//  AlgorithmsExercises
//  Created by hg on 11/07/2022.
//
//  |Design Twitter|
//  |Design|
//  Design a simplified version of Twitter where users can post tweets, follow/unfollow another user, and is able to see the 10 most recent tweets in the user's news feed.
//  Implement the Twitter class:
//  Twitter() Initializes your twitter object.
//  void postTweet(int userId, int tweetId) Composes a new tweet with ID tweetId by the user userId. Each call to this function will be made with a unique tweetId.
//  List<Integer> getNewsFeed(int userId) Retrieves the 10 most recent tweet IDs in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user themself. Tweets must be ordered from most recent to least recent.
//  void follow(int followerId, int followeeId) The user with ID followerId started following the user with ID followeeId.
//  void unfollow(int followerId, int followeeId) The user with ID followerId started unfollowing the user with ID followeeId.
//

import Foundation

class DesignTwitterBST {
    
    private struct Tweet {
        let id: Int
        let date: Date
    }
    
    private let maxFeedTweets: Int
    private var tweets: [Int: LLRBT<Date, Tweet>]
    private var newsFeeds: [Int: LLRBT<Date,Tweet>]
    private var follows: [Int: Set<Int>]
    private var followers: [Int: Set<Int>]
    
    init() {
        self.maxFeedTweets = 10
        self.tweets = [:]
        self.newsFeeds = [:]
        self.follows = [:]
        self.followers = [:]
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweetTree = tweets[userId] ?? LLRBT()
        let tweet = Tweet(id: tweetId, date: Date())
        tweetTree.put(key: tweet.date, value: tweet)
        if tweets[userId] == nil { tweets[userId] = tweetTree }
        
        addToFeed(userId, tweet)
        for follower in followers[userId, default: []] {
            addToFeed(follower, tweet)
        }
    }
    
    private func addToFeed(_ userId: Int, _ tweet: Tweet) {
        let feed = newsFeeds[userId] ?? LLRBT()
        if feed.size() == 10 { feed.deleteMin() }
        feed.put(key: Date(), value: tweet)
        if newsFeeds[userId] == nil { newsFeeds[userId] = feed }
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        let tweets = newsFeeds[userId]
            .map { $0.getValuesInDecreasingOrder(amount: maxFeedTweets) } ?? []
        
        return tweets.map { $0.id }
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        follows[followerId, default: [followerId]].insert(followeeId)
        followers[followeeId, default: []].insert(followerId)
        updateFeedOnFollow(followerId, followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard let followees = follows[followerId], followees.contains(followeeId) else { return }
        follows[followerId]?.remove(followeeId)
        followers[followeeId]?.remove(followerId)
        updateFeedOnUnfollow(followerId)
    }
    
    private func updateFeedOnFollow(_ userId: Int, _ followeeId: Int) {
        let newsFeed = newsFeeds[userId] ?? LLRBT()
        let followeeTweets = tweets[followeeId]?.getValuesInDecreasingOrder(amount: 10) ?? []
        updateFeedWithTweets(newsFeed, followeeTweets)
        if newsFeeds[userId] == nil { newsFeeds[userId] = newsFeed }
    }
    
    private func updateFeedOnUnfollow(_ userId: Int) {
        let newsFeed = LLRBT<Date, Tweet>()
        let followees = follows[userId] ?? []
        
        for followeeId in followees {
            let followeeTweets = tweets[followeeId]?.getValuesInDecreasingOrder(amount: 10) ?? []
            updateFeedWithTweets(newsFeed, followeeTweets)
        }
        
        newsFeeds[userId] = newsFeed
    }
    
    private func updateFeedWithTweets(_ newsFeed: LLRBT<Date, Tweet>, _ tweets: [Tweet]) {
        for tweet in tweets {
            if newsFeed.size() == 10 {
                if let min = newsFeed.min(), tweet.date > min.date {
                    newsFeed.put(key: tweet.date, value: tweet)
                    if newsFeed.size() > 10 { newsFeed.deleteMin() }
                }
                else {
                    return
                }
            }
            else {
                newsFeed.put(key: tweet.date, value: tweet)
            }
        }
    }
    
}

extension DesignTwitterBST {
    
    enum RBTNodeColor {
        case red
        case black
    }
    
    class RBTNode<Key, Value> where Key: Comparable {
        var key: Key
        var value: Value
        var left: RBTNode<Key,Value>?
        var right: RBTNode<Key,Value>?
        var count: Int
        var color: RBTNodeColor
        
        init(key: Key, value: Value, color: RBTNodeColor) {
            self.key = key
            self.value = value
            self.color = color
            self.count = 1
        }
        
        func flipColor() {
            switch color {
            case .red: color = .black
            case .black: color = .red
            }
        }
    }
    
    class LLRBT<Key, Value> where Key: Comparable {
        fileprivate var root: RBTNode<Key,Value>?
        
        init() {}
        
        func put(key: Key, value: Value) {
            root = put(key: key, value: value, node: root)
            root?.color = .black
        }
        
        private func put(key: Key, value: Value, node: RBTNode<Key,Value>?) -> RBTNode<Key,Value> {
            guard let someNode = node else { return RBTNode<Key,Value>(key: key, value: value, color: .red) }
            
            if key < someNode.key { someNode.left = put(key: key, value: value, node: someNode.left) }
            else if key > someNode.key { someNode.right = put(key: key, value: value, node: someNode.right) }
            else { someNode.value = value }
            
            return balance(node: someNode)
        }
        
        public func min() -> Value? {
            guard let root = root else { return nil }
            let minNode = min(node: root)
            return minNode.value
        }
        
        private func min(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            var node = node
            while let someNode = node.left { node = someNode }
            return node
        }
        
        func deleteMin() {
            guard let someRoot = root else { return }
            
            if !isRed(node: someRoot.left) && !isRed(node: someRoot.right) {
                someRoot.color = .red
            }
            
            root = deleteMin(node: someRoot)
            
            if let root = root { root.color = .black }
        }
        
        private func deleteMin(node: RBTNode<Key,Value>?) -> RBTNode<Key,Value>? {
            guard var someNode = node, someNode.left != nil else { return nil }
            
            if !isRed(node: someNode.left) && !isRed(node: someNode.left?.left) {
                someNode = moveRedLeft(node: someNode)
            }
            
            someNode.left = deleteMin(node: someNode.left)
            return balance(node: someNode)
        }
        
        private func balance(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            var node = node
            
            if isRed(node: node.right) && !isRed(node: node.left) { node = rotateLeft(node: node) }
            if isRed(node: node.left) && isRed(node: node.left?.left) { node = rotateRight(node: node) }
            if isRed(node: node.left) && isRed(node: node.right) { flipColors(node: node) }
            node.count = 1 + size(node: node.left) + size(node: node.right)
            
            return node
        }
        
        private func rotateLeft(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            guard let rightNode = node.right else { return node }
            node.right = rightNode.left
            rightNode.left = node
            rightNode.color = node.color
            node.color = .red
            rightNode.count = node.count
            node.count = 1 + size(node: node.left) + size(node: node.right)
            return rightNode
        }
        
        private func rotateRight(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            guard let leftNode = node.left else { return node }
            node.left = leftNode.right
            leftNode.right = node
            leftNode.color = node.color
            node.color = .red
            leftNode.count = node.count
            node.count = 1 + size(node: node.left) + size(node: node.right)
            return leftNode
        }
        
        private func flipColors(node: RBTNode<Key,Value>) {
            node.flipColor()
            node.left?.flipColor()
            node.right?.flipColor()
        }
        
        private func moveRedLeft(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            var node = node
            
            flipColors(node: node)
            
            if let rightNode = node.right, isRed(node: rightNode.left) {
                node.right = rotateRight(node: rightNode)
                node = rotateLeft(node: node)
                flipColors(node: node)
            }
            
            return node
        }
        
        private func moveRedRight(node: RBTNode<Key,Value>) -> RBTNode<Key,Value> {
            var node = node
            
            flipColors(node: node)
            
            if isRed(node: node.left?.left) {
                node = rotateRight(node: node)
                flipColors(node: node)
            }
            
            return node
        }
        
        private func isRed(node: RBTNode<Key,Value>?) -> Bool {
            return node?.color == .red
        }
        
        func size() -> Int {
            return size(node: root)
        }
        
        private func size(node: RBTNode<Key, Value>?) -> Int {
            return node?.count ?? 0
        }
        
        func getValuesInDecreasingOrder(amount: Int) -> [Value] {
            func reverseInorder(node: RBTNode<Key, Value>?) {
                guard let node = node else { return }
                reverseInorder(node: node.right)
                if values.count == amount { return }
                values.append(node.value)
                reverseInorder(node: node.left)
            }
            
            var values = [Value]()
            reverseInorder(node: root)
            return values
        }
    }
    
}
