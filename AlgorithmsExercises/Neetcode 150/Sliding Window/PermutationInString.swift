//
//  PermutationInString.swift
//  AlgorithmsExercises
//  Created by hg on 10/07/2022.
//
//  |Permutation in String|
//  |Hash Table|Two Pointers|String|Sliding Window|
//  Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
//  In other words, return true if one of s1's permutations is the substring of s2.
//

import Foundation

class PermutationInString {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else { return false }
        let patCount = s1.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var strCount = s2.prefix(s1.count - 1).reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var left = s2.startIndex
        var right = s2.index(s2.startIndex, offsetBy: s1.count - 1)
        
        while right < s2.endIndex {
            strCount[s2[right], default: 0] += 1
            if strCount == patCount { return true }
            strCount[s2[left]]! -= 1
            if strCount[s2[left]] == 0 { strCount[s2[left]] = nil }
            left = s2.index(after: left)
            right = s2.index(after: right)
        }
        
        return false
    }
    
}
