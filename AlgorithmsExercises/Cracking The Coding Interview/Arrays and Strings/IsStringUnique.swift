//
//  IsStringUnique.swift
//  AlgorithmsExercises
//  Created by hg on 16/02/2022.
//
//  Implement an algorithm to determine if a string has all unique characters.
//  What if you cannot use additional data structures?
//

import Foundation

class IsStringUnique {
    
    func isUniqueV1(str: String) -> Bool {
        var dict = [Character: Bool]()
        
        for char in str {
            let isPresent = dict[char] == true
            if isPresent { return false }
            dict[char] = true
        }
        
        return true
    }
    
    // Bits represent characters (assumes lowercase a-z)
    func isUniqueV2(str: String) -> Bool {
        let aValue = Character("a").asciiValue!
        var checker: UInt8 = 0
        
        for char in str {
            let val = char.asciiValue! - aValue
            
            if (checker & (1 << val)) > 0 { return false }
            
            checker = checker | (1 << val)
        }
        
        return true
    }
    
}
