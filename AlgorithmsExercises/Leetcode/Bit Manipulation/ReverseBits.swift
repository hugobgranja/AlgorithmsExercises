//
//  ReverseBits.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/05/2022.
//
//  Reverse bits of a given 32 bits unsigned integer.
//

import Foundation

class ReverseBits {
    
    func solve(_ n: Int) -> Int {
        var result = 0
        var n = n
        var bitCount = 31
        
        while n > 0 {
            let rightmostBit = n & 1
            result |= rightmostBit << bitCount
            n >>= 1
            bitCount -= 1
        }
        
        return result
    }
    
}
