//
//  DesignTwitter.swift
//  AlgorithmsExercises
//
//  Created by hg on 12/07/2022.
//

import Foundation
import SwiftAlgorithms

class DesignTwitter {

    struct Tweet {
        let id: Int
        let order: UInt
    }
    
    private var userTweets: [Int: Deque<Tweet>]
    private var userFollows: [Int: Set<Int>]
    private var tweetCount: UInt
    
    init() {
        userTweets = [:]
        userFollows = [:]
        tweetCount = 0
    }
    
    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(id: tweetId, order: tweetCount)
        
        if userTweets[userId] == nil {
            userTweets[userId] = Deque(capacity: 10)
        }
        else if userTweets[userId]!.count == 10 {
            userTweets[userId]!.popFirst()
        }
        
        userTweets[userId]!.append(tweet)
        tweetCount += 1
    }
    
    func getNewsFeed(_ userId: Int) -> [Int] {
        userFollows[userId, default: []].insert(userId)
        let followees = userFollows[userId]!
        let pq = BinaryHeap<Tweet> { $0.order < $1.order }
        
        for followee in followees {
            if let tweets = userTweets[followee] {
                for tweet in tweets {
                    pq.enqueue(tweet)
                }
            }
        }
        
        var newsFeed = [Int]()
        
        while let tweet = pq.dequeue(), newsFeed.count < 10 {
            newsFeed.append(tweet.id)
        }
        
        return newsFeed
    }
    
    func follow(_ followerId: Int, _ followeeId: Int) {
        userFollows[followerId, default: []].insert(followeeId)
    }
    
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        userFollows[followerId]?.remove(followeeId)
    }
    
}
