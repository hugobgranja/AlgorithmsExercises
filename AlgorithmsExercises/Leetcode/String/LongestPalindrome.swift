//
//  LongestPalindrome.swift
//  AlgorithmsExercises
//
//  Created by hg on 26/05/2022.
//
//  Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
//  Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
//

import Foundation

class LongestPalindrome {
    
    func solve(_ s: String) -> Int {
        var counts = [Character: Int]()
        var longestCount = 0
        
        for char in s {
            counts[char, default: 0] += 1
            
            if counts[char]!.isMultiple(of: 2) {
                longestCount += 2
            }
        }
        
        return min(longestCount + 1, s.count)
    }
    
}
