//
//  ValidAnagram.swift
//  AlgorithmsExercises
//
//  Created by hg on 25/05/2022.
//
//  Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//  Alternative solution: Sort and compare for O(1) space.
//

import Foundation

class ValidAnagram {
    
    func solve(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        let sMap = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        let tMap = t.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        return sMap == tMap
    }
    
}
