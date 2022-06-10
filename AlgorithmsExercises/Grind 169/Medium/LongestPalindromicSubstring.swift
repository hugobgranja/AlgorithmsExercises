//
//  LongestPalindromicSubstring.swift
//  AlgorithmsExercises
//  Created by hg on 07/06/2022.
//
//  |Longest Palindromic Substring|
//  |Dynamic Programming|Named Algorithm|
//  Given a string s, return the longest palindromic substring in s.
//

import Foundation

class LongestPalindromicSubstring {
    
    func longestPalindrome(_ s: String) -> String {
        let transformedText = transform(text: s)
        var lpsi = [Int](repeating: 0, count: transformedText.count)
        var center = 0
        var right = 0
        
        for index in 1..<transformedText.count - 1 {
            let mirror = 2 * center - index
            
            if right > index {
                lpsi[index] = min(right - index, lpsi[mirror])
            }
            
            while transformedText[index + (1 + lpsi[index])] ==
                    transformedText[index - (1 + lpsi[index])] {
                lpsi[index] += 1
            }
            
            if index + lpsi[index] > right {
                center = index
                right = index + lpsi[index]
            }
        }
        
        let (longestCenter, length) = lpsi.enumerated().max { $0.element < $1.element }!
        let start = (longestCenter - 1 - length) / 2
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(startIndex, offsetBy: length)
        return String(s[startIndex..<endIndex])
    }
    
    private func transform(text: String) -> [Character] {
        var transformed: [Character] = ["$", "#"]
        
        for char in text {
            transformed.append(char)
            transformed.append("#")
        }
        
        transformed.append("@")
        
        return transformed
    }

}
