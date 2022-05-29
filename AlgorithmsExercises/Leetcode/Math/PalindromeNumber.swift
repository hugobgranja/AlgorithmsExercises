//
//  PalindromeNumber.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/05/2022.
//
//  Given an integer x, return true if x is palindrome integer.
//  An integer is a palindrome when it reads the same backward as forward.
//  For example, 121 is a palindrome while 123 is not.
//

import Foundation

class PalindromeNumber {
    
    // O(log10(n)) time
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) { return false }

        var x = x
        var reversedHalf = 0
        
        while x > reversedHalf {
            reversedHalf = reversedHalf * 10 + x % 10
            x /= 10
        }

        return x == reversedHalf || x == reversedHalf / 10
    }
    
}
