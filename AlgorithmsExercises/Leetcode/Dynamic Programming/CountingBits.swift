//
//  CountingBits.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.
//

import Foundation

class CountingBits {
    
    // O(n Log n) time (See NumberOfOneBits for an optimization)
    func solve(_ n: Int) -> [Int] {
        var count = [Int]()
        
        for num in 0...n {
            var num = num
            var currentCount = 0
            
            while num > 0 {
                currentCount += num % 2
                num >>= 2
            }
            
            count.append(currentCount)
        }
        
        return count
    }
    
    // O(n) time - Bottom-up approach of above
    func solveDP(_ n: Int) -> [Int] {
        var count = [0]
        
        for num in (0...n).dropFirst() {
            let onesCount = count[num / 2] + num % 2
            count.append(onesCount)
        }
        
        return count
    }
    
}
