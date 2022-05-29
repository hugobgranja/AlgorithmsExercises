//
//  RomanToInteger.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//

import Foundation

class RomanToInteger {
    
    let map: [Character: Int] = [
        "I": 1, "V": 5, "X": 10,
        "L": 50, "C": 100, "D": 500,
        "M": 1000,
    ]
    
    func solve(_ s: String) -> Int {
        var prevValue = 0
        var totalValue = 0
        
        for char in s {
            let charValue = map[char]!
            totalValue += charValue
            if prevValue < charValue { totalValue -= prevValue * 2 }
            prevValue = charValue
        }
        
        return totalValue
    }
    
}
