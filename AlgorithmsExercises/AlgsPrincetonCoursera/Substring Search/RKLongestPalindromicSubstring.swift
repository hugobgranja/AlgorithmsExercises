//
//  RKLongestPalindromicSubstring.swift
//  AlgorithmsExercises
//  Created by hg on 08/04/2022.
//
//  Longest palindromic substring.
//  Given a string s, find the longest substring that is a palindrome in expected linearithmic time.
//  Signing bonus: Do it in linear time in the worst case.
//
//  Rabin-Karp based solution
//  O(n log n) time
//  Large palindromes contain smaller palindromes
//  Use binary search to find the longest palindrome length
//  Check even and odd palindromes because a size 4 and 2 palindrome might not exist but a size 5 might
//  An even palindrome may only contain even palindromes and an odd palindrome may only contain odd palindromes
//  In the rolling hash of the reverse substring we shift all characters one position to the right by multiplying by the modular multiplicative inverse since we're using modular arithmetic.
//

import Foundation

class RKLongestPalindromicSubstring {
    
    private let radix: UInt64
    private let prime: UInt64
    private let multiplicativeInverse: UInt64
    
    init() {
        self.radix = 128
        self.prime = 2_147_483_629
        self.multiplicativeInverse = 2_600_468_457
    }
    
    func lps(text: String) -> String {
        let text = Array(text)
        let longestEvenPalindrome = leps(text: text)
        let longestOddPalindrome = lops(text: text)
        
        if longestEvenPalindrome.count > longestOddPalindrome.count {
            return String(longestEvenPalindrome)
        }
        else {
            return String(longestOddPalindrome)
        }
    }
    
    // Even length palindromes
    private func leps(text: [Character]) -> ArraySlice<Character> {
        var longestLength = 1
        var longestIndex = 0
        var low = 2, high = text.count
        
        while low <= high {
            var mid = low + (high - low) / 2
            if !mid.isMultiple(of: 2) { mid -= 1 }
            
            if let index = search(text, length: mid) {
                low = mid + 2
                longestIndex = index
                longestLength = mid
            }
            else {
                high = mid - 2
            }
        }
        
        return text[longestIndex...].prefix(longestLength)
    }
    
    // Odd length palindromes
    private func lops(text: [Character]) -> ArraySlice<Character> {
        var longestLength = 1
        var longestIndex = 0
        var low = 3, high = text.count
        
        while low <= high {
            var mid = low + (high - low) / 2
            if mid.isMultiple(of: 2) { mid -= 1 }
            
            if let index = search(text, length: mid) {
                low = mid + 2
                longestIndex = index
                longestLength = mid
            }
            else {
                high = mid - 2
            }
        }
        
        return text[longestIndex...].prefix(longestLength)
    }
    
    private func search(_ text: [Character], length: Int) -> Int? {
        guard text.count >= length else { return nil }
        
        let trimmedText = text.prefix(length)
        let reversedText = trimmedText.reversed()
        let rm = computeRM(length: length)
        var textHash = hash(key: trimmedText)
        var revTextHash = hash(key: reversedText)
        
        if textHash == revTextHash { return 0 }
        
        for i in length..<text.count {
            let leadingValue = UInt64(text[i - length].asciiValue!)
            let currentValue = UInt64(text[i].asciiValue!)
            
            textHash = (textHash + prime - rm * leadingValue % prime) % prime
            textHash = (textHash * radix + currentValue) % prime
            
            revTextHash -= leadingValue
            revTextHash = (revTextHash * multiplicativeInverse % prime + rm * currentValue % prime) % prime
            
            if textHash == revTextHash {
                return i - length + 1
            }
        }
        
        return nil
    }
    
    private func computeRM(length: Int) -> UInt64 {
        var rm: UInt64 = 1
        
        for _ in 1..<length {
            rm = (radix * rm) % prime
        }
        
        return rm
    }
    
    private func hash<T: BidirectionalCollection>(key: T) -> UInt64 where T.Element == Character {
        var hash: UInt64 = 0
        
        for char in key {
            let charValue = UInt64(char.asciiValue!)
            hash = (radix * hash + charValue) % prime
        }
        
        return hash
    }
    
}
