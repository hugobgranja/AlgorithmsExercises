//
//  Manacher.swift
//  AlgorithmsExercises
//
//  Created by hg on 11/04/2022.
//

import Foundation

class Manacher {
    
    func lps(text: String) -> Substring {
        let transformedText = text.reduce("$#") { $0 + String($1) + "#" } + "@"
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
        let end = (longestCenter - 1 + length) / 2
        return text[start..<end]
    }
    
}
