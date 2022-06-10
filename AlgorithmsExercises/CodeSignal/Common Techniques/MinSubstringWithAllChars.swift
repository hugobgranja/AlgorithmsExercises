//
//  MinSubstringWithAllChars.swift
//  AlgorithmsExercises
//  Created by hg on 22/05/2022.
//
//  Minimum Window Substring
//  You have two strings, s and t. The string t contains only unique elements.
//  Find and return the minimum consecutive substring of s that contains all of the elements from t.
//  It's guaranteed that the answer exists.
//  If there are several answers, return the one which starts from the smallest index.
//

import Foundation

class MinSubstringWithAllChars {
    
    func solve(s: String, t: String) -> String {
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
