//
//  Manacher.swift
//  AlgorithmsExercises
//  Created by hg on 11/04/2022.
//
//  Manacher's algorithm
//  Finds the longest palindromic substring in linear time.
//

import Foundation

class Manacher {
    
    func lps(text: String) -> Substring {
        let transformedText = transform(text: text)
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
        
        let startIndex = text.index(text.startIndex, offsetBy: start)
        let endIndex = text.index(startIndex, offsetBy: length)
        return text[startIndex..<endIndex]
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
