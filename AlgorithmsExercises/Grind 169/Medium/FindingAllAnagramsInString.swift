//
//  FindingAllAnagramsInString.swift
//  AlgorithmsExercises
//  Created by hg on 08/06/2022.
//
//  |Find All Anagrams in a String|
//  |String|Sliding Window|Counting|
//  Given two strings s and p, return an array of all the start indices of p's anagrams in s. You may return the answer in any order.
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//

import Foundation

class FindAllAnagramsInString {
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        guard s.count >= p.count else { return [] }
        
        let s = Array(s)
        let patCount = p.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var strCount = s.prefix(p.count - 1).reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        var left = 0
        var right = p.count - 1
        var result = [Int]()
        
        while right < s.endIndex {
            strCount[s[right], default: 0] += 1
            if strCount == patCount { result.append(left) }
            strCount[s[left]]! -= 1
            if strCount[s[left]] == 0 { strCount[s[left]] = nil }
            left += 1
            right += 1
        }
        
        return result
    }
    
}
