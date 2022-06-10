//
//  WordLadder.swift
//  AlgorithmsExercises
//  Created by hg on 26/06/2022.
//
//  |World Ladder|
//  |Hash Table|String|BFS|
//  A transformation sequence from word beginWord to word endWord using a dictionary wordList is a sequence of words beginWord -> s1 -> s2 -> ... -> sk such that:
//  Every adjacent pair of words differs by a single letter.
//  Every si for 1 <= i <= k is in wordList. Note that beginWord does not need to be in wordList.
//  sk == endWord
//  Given two words, beginWord and endWord, and a dictionary wordList, return the number of words in the shortest transformation sequence from beginWord to endWord, or 0 if no such sequence exists.
//

import Foundation

class WordLadder {
    
    // BFS
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) { return 0 }
        let adjacencyList = buildAdjacencyList(beginWord, wordList)
        var visited = Set([beginWord])
        var queue = [beginWord]
        var length = 1
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let word = queue.removeFirst()
                if word == endWord { return length }
                
                for index in word.indices {
                    let pattern = word[..<index] + "*" + word[index...].dropFirst()
                    for adjacent in adjacencyList[pattern]! {
                        if !visited.contains(adjacent) {
                            visited.insert(adjacent)
                            queue.append(adjacent)
                        }
                    }
                }
            }
            
            length += 1
        }
        
        return 0
    }
    
    // Bidirectional BFS from beginWord and endWord stop when meet in the middle
    func ladderLength2(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        func visit(_ queue: inout [String], _ visited: inout Set<String>, _ otherVisited: Set<String>) -> Bool {
            for _ in 0..<queue.count {
                let word = queue.removeFirst()
                
                for index in word.indices {
                    let pattern = word[..<index] + "*" + word[index...].dropFirst()
                    for adjacent in adjacencyList[pattern]! {
                        if otherVisited.contains(adjacent) {
                            return true
                        }
                        if !visited.contains(adjacent) {
                            visited.insert(adjacent)
                            queue.append(adjacent)
                        }
                    }
                }
            }
            
            return false
        }
        
        if !wordList.contains(endWord) { return 0 }
        let adjacencyList = buildAdjacencyList(beginWord, wordList)
        var visitedBegin = Set([beginWord])
        var visitedEnd = Set([endWord])
        var queueBegin = [beginWord]
        var queueEnd = [endWord]
        var length = 1
        
        while !queueBegin.isEmpty && !queueEnd.isEmpty {
            if queueBegin.count <= queueEnd.count {
                if visit(&queueBegin, &visitedBegin, visitedEnd) { return length + 1 }
            }
            else {
                if visit(&queueEnd, &visitedEnd, visitedBegin) { return length + 1 }
            }
            
            length += 1
        }
        
        return 0
    }
    
    private func buildAdjacencyList(_ beginWord: String, _ wordList: [String]) -> [Substring: [String]] {
        var adjacencyList = [Substring: [String]]()
        
        for index in beginWord.indices {
            let pattern = beginWord[..<index] + "*" + beginWord[index...].dropFirst()
            adjacencyList[pattern, default: []].append(beginWord)
        }
        
        for word in wordList {
            for index in word.indices {
                let pattern = word[..<index] + "*" + word[index...].dropFirst()
                adjacencyList[pattern, default: []].append(word)
            }
        }
        
        return adjacencyList
    }
    
    func ladderLength3(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordSet = Set(wordList)
        if !wordSet.contains(endWord) { return 0 }
        var length = 1
        var queue = [beginWord]
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let word = queue.removeFirst()
                
                for index in word.indices {
                    for letter in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(word[..<index] + "\(letter)" + word[index...].dropFirst())
                        if newWord == endWord { return length + 1 }
                        if wordSet.contains(newWord) {
                            queue.append(newWord)
                            wordSet.remove(newWord)
                        }
                    }
                }
            }
            
            length += 1
        }
        
        return 0
    }
    
    // Bidirectional BFS
    func ladderLength4(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        func visit(_ queue: inout [String], _ visited: inout Set<String>, _ otherVisited: Set<String>) -> Bool {
            for _ in 0..<queue.count {
                let word = queue.removeFirst()
                
                for index in word.indices {
                    for letter in "abcdefghijklmnopqrstuvwxyz" {
                        let newWord = String(word[..<index] + "\(letter)" + word[index...].dropFirst())
                        if otherVisited.contains(newWord) {
                            return true
                        }
                        if wordSet.contains(newWord) {
                            queue.append(newWord)
                            visited.insert(newWord)
                            wordSet.remove(newWord)
                        }
                    }
                }
            }
            
            return false
        }
        
        var wordSet = Set(wordList)
        if !wordSet.contains(endWord) { return 0 }
        var visitedBegin = Set([beginWord])
        var visitedEnd = Set([endWord])
        var queueBegin = [beginWord]
        var queueEnd = [endWord]
        var length = 1
        
        while !queueBegin.isEmpty && !queueEnd.isEmpty {
            if queueBegin.count <= queueEnd.count {
                if visit(&queueBegin, &visitedBegin, visitedEnd) { return length + 1 }
            }
            else {
                if visit(&queueEnd, &visitedEnd, visitedBegin) { return length + 1 }
            }
            
            length += 1
        }
        
        return 0
    }
    
}
