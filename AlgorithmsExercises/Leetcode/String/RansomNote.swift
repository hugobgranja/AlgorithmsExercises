//
//  RansomNote.swift
//  AlgorithmsExercises
//
//  Created by hg on 26/05/2022.
//
//  Given two strings ransomNote and magazine, return true if ransomNote can be constructed from magazine and false otherwise.
//  Each letter in magazine can only be used once in ransomNote.
//

import Foundation

class RansomNote {
    
    func solve(_ ransomNote: String, _ magazine: String) -> Bool {
        var charCounts = magazine
            .reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        
        for char in ransomNote {
            if let count = charCounts[char], count > 0 {
                charCounts[char]! -= 1
            }
            else {
                return false
            }
        }
        
        return true
    }
    
}
