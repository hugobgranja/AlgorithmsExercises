//
//  NumberOfOneBits.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).
//
//  Follow up: If this function is called many times, how would you optimize it?
//  Answer: cache values
//

import Foundation

class NumberOfOneBits {
    
    func solve(_ n: Int) -> Int {
        return n.nonzeroBitCount
    }
    
    func solve2(_ n: Int) -> Int {
        var n = n
        var count = 0
            
        while n > 0 {
            count += n % 2
            n >>= 2
        }
        
        return count
    }
    
    // Removes the rightmost 1 every iteration
    func solve3(_ n: Int) -> Int {
        var n = n
        var count = 0
            
        while n > 0 {
            n &= n - 1
            count += 1
        }
        
        return count
    }
    
}
