//
//  LongestRepeatingCharacterReplacement.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Longest Repeating Character Replacement|
//  |String|Hash Table|Sliding Window|
//  You are given a string s and an integer k.
//  You can choose any character of the string and change it to any other uppercase English character.
//  You can perform this operation at most k times.
//  Return the length of the longest substring containing the same letter you can get after performing the above operations.
//

import Foundation

class LongestRepeatingCharacterReplacement {
    
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var counts = [Character: Int]()
        var left = s.startIndex
        var right = s.startIndex
        var currentLength = 1
        var longest = 0
        
        counts[s[left]] = 1
        
        while right < s.endIndex {
            let maxCount = counts.values.max { $0 < $1 }!
            
            if currentLength - maxCount <= k {
                longest = max(longest, currentLength)
                right = s.index(after: right)
                
                if right < s.endIndex {
                    counts[s[right], default: 0] += 1
                    currentLength += 1
                }
            }
            else {
                counts[s[left]]! -= 1
                left = s.index(after: left)
                currentLength -= 1
            }
        }
        
        return longest
    }
    
    func characterReplacement2(_ s: String, _ k: Int) -> Int {
        var counts = [Character: Int]()
        var left = s.startIndex
        var currentLength = 0
        var longest = 0
        
        for right in s.indices {
            counts[s[right], default: 0] += 1
            currentLength += 1
            
            while currentLength - counts.values.max(by: { $0 < $1 })! > k {
                counts[s[left]]! -= 1
                currentLength -= 1
                left = s.index(after: left)
            }
            
            longest = max(longest, currentLength)
        }
        
        return longest
    }
    
    // Keep var with max frequency
    // Longest only increases when max frequency increases there's no need to decrement it
    func characterReplacement3(_ s: String, _ k: Int) -> Int {
        var counts = [Character: Int]()
        var left = s.startIndex
        var currentLength = 0
        var longest = 0
        var maxFrequency = 0
        
        for right in s.indices {
            counts[s[right], default: 0] += 1
            currentLength += 1
            maxFrequency = max(maxFrequency, counts[s[right]]!)
            
            while currentLength - maxFrequency > k {
                counts[s[left]]! -= 1
                currentLength -= 1
                left = s.index(after: left)
            }
            
            longest = max(longest, currentLength)
        }
        
        return longest
    }
    
}
