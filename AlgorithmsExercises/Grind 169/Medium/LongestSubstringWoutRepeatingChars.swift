//
//  LongestSubstringWoutRepeatingChars.swift
//  AlgorithmsExercises
//  Created by hg on 30/05/2022.
//
//  |Longest Substring Without Repeating Characters|
//  |Hash Table|Sliding Window|
//  Given a string s, find the length of the longest substring without repeating characters.
//

import Foundation

class LongestSubstringWoutRepeatingChars {
    
    func solve(_ s: String) -> Int {
        let s = Array(s)
        var map = [Character: Int]()
        var firstNonRepeatedCharIndex = 0
        var maxLength = 0
        
        for (index, char) in zip(s.indices, s) {
            if let charIndex = map[char], charIndex >= firstNonRepeatedCharIndex {
                firstNonRepeatedCharIndex = charIndex + 1
            }
            
            maxLength = max(maxLength, index - firstNonRepeatedCharIndex + 1)
            map[char] = index
        }
        
        return maxLength
    }
    
    func solve2(_ s: String) -> Int {
        var set = Set<Character>()
        var left = s.startIndex
        var maxLength = 0
        
        for (index, char) in zip(s.indices, s) {
            while set.contains(s[index]) {
                set.remove(s[left])
                left = s.index(after: left)
            }
            
            set.insert(char)
            maxLength = max(maxLength, s.distance(from: left, to: index) + 1)
        }
        
        return maxLength
    }
    
}
