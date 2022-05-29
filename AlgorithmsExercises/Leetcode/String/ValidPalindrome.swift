//
//  ValidPalindrome.swift
//  AlgorithmsExercises
//
//  Created by hg on 24/05/2022.
//
//  A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward.
//  Alphanumeric characters include letters and numbers.
//  Given a string s, return true if it is a palindrome, or false otherwise.
//

import Foundation

class ValidPalindrome {
    
    func solve(_ s: String) -> Bool {
        if s.isEmpty { return true }
        
        var leadingIndex = s.startIndex
        var trailingIndex = s.endIndex
        
        while leadingIndex < trailingIndex {
            trailingIndex = s.index(before: trailingIndex)
            
            while leadingIndex < trailingIndex && !isAlphanumeric(s[leadingIndex]) {
                leadingIndex = s.index(after: leadingIndex)
            }
            
            while trailingIndex > leadingIndex && !isAlphanumeric(s[trailingIndex]) {
                trailingIndex = s.index(before: trailingIndex)
            }
            
            // Note: This comparison might not always work if expected character set != ASCII
            if s[leadingIndex].lowercased() != s[trailingIndex].lowercased() {
                return false
            }
            
            leadingIndex = s.index(after: leadingIndex)
        }
        
        return true
    }
    
    private func isAlphanumeric(_ char: Character) -> Bool {
        return char.isLetter || char.isNumber
    }
    
    func solveCompact(_ s: String) -> Bool {
        let filtered = s.filter { $0.isLetter || $0.isNumber }
        let reversed = String(filtered.reversed())
        return filtered.caseInsensitiveCompare(reversed) == .orderedSame
    }
    
}
