//
//  FindSubstrings.swift
//  AlgorithmsExercises
//  Created by hg on 10/05/2022.
//
//  You have two arrays of strings, words and parts.
//  Return an array that contains the strings from words, modified so that any occurrences of the substrings from parts are surrounded by square brackets [], following these guidelines:
//  If several parts substrings occur in one string in words, choose the longest one. If there is still more than one such part, then choose the one that appears first in the string.
//

import Foundation
import SwiftAlgorithms

class FindSubstrings {
    
    func solveNaive(words: [String], parts: [String]) -> [String] {
        return words.map { word in
            parts
                .compactMap { word.range(of: $0) }
                .max { areInIncreasingOrder($0, $1, word) }
                .map { transform(word: word, in: $0) }
                ?? word
        }
    }
    
    private func areInIncreasingOrder(_ lhs: Range<String.Index>, _ rhs: Range<String.Index>, _ word: String) -> Bool {
        let leftLength = word.distance(from: lhs.lowerBound, to: lhs.upperBound)
        let rightLength = word.distance(from: rhs.lowerBound, to: rhs.upperBound)
        if leftLength == rightLength { return lhs.lowerBound > rhs.lowerBound }
        return leftLength < rightLength
    }
    
    private func transform(word: String, in range: Range<String.Index>) -> String {
        return word.prefix(upTo: range.lowerBound) +
            "[" + word[range] + "]" +
            word.suffix(from: range.upperBound)
    }
    
    func solve(words: [String], parts: [String]) -> [String] {
        let trie = Trie()
        parts.forEach { trie.insert($0) }
        
        var result = [String]()
        
        for word in words {
            if let range = findLongestSubstring(in: word, using: trie) {
                let newWord = transform(word: word, in: range)
                result.append(newWord)
            }
            else {
                result.append(word)
            }
        }
        
        return result
    }
    
    private func findLongestSubstring(in word: String, using trie: Trie) -> Range<String.Index>? {
        var longestRange: Range<String.Index>?
        var longestDistance = 0
        
        for startIndex in word.indices {
            let suffix = word.suffix(from: startIndex)
            var endIndex = suffix.startIndex
            var node = trie.root
            
            while endIndex < suffix.endIndex, let someNode = node.next[suffix[endIndex]] {
                node = someNode
                endIndex = suffix.index(after: endIndex)
                
                if node.isMember {
                    let range = startIndex..<endIndex
                    let distance = word[range].count
                    
                    if distance > longestDistance {
                        longestRange = range
                        longestDistance = distance
                    }
                }
            }
        }
        
        return longestRange
    }
    
    func solveAhoCorasick(words: [String], parts: [String]) -> [String] {
        let ac = AhoCorasick(patterns: parts)
        var result = [String]()
        
        for word in words {
            let ranges = ac.matches(in: word)
            
            if let longestRange = ranges.max(by: { word[$0].count < word[$1].count }) {
                let newWord = transform(word: word, in: longestRange)
                result.append(newWord)
            }
            else {
                result.append(word)
            }
        }
        
        return result
    }
    
}
