//
//  MinimumWindowSubstring.swift
//  AlgorithmsExercises
//  Created by hg on 24/06/2022.
//
//  |Minimum Window Substring|
//  |String|Hash Table|Sliding Window|
//  Given two strings s and t of lengths m and n respectively, return the minimum window substring of s such that every character in t (including duplicates) is included in the window.
//  If there is no such substring, return the empty string "".
//  The testcases will be generated such that the answer is unique.
//  A substring is a contiguous sequence of characters within the string.
//

import Foundation

class MinimumWindowSubstring {
    
    // Optimization could use a single count map by incrementing and decrementing.
    func minWindow(_ s: String, _ t: String) -> String {
        if t.isEmpty { return "" }
        let patCount = t.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var windowCount = t.reduce(into: [Character: Int]()) { $0[$1] = 0 }
        var maxRange: ClosedRange<String.Index>?
        var maxLength = Int.max
        var containedCount = 0
        var currentLength = 0
        var lowerBound = s.startIndex
        
        for (index, char) in zip(s.indices, s) {
            currentLength += 1
            
            if windowCount[char] != nil {
                windowCount[char]! += 1
                if windowCount[char]! == patCount[char]! { containedCount += 1 }
            }
            
            while containedCount == patCount.count {
                if currentLength < maxLength {
                    maxRange = lowerBound...index
                    maxLength = currentLength
                }
                
                let leadingChar = s[lowerBound]
                if windowCount[leadingChar] != nil {
                    windowCount[leadingChar]! -= 1
                    if windowCount[leadingChar]! < patCount[leadingChar]! { containedCount -= 1 }
                }
                
                lowerBound = s.index(after: lowerBound)
                currentLength -= 1
            }
        }
        
        return maxRange.map { String(s[$0]) } ?? ""
    }
    
}
