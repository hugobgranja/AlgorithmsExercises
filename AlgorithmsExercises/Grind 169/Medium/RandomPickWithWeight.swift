//
//  RandomPickWithWeight.swift
//  AlgorithmsExercises
//  Created by hg on 16/06/2022.
//
//  |Random Pick With Weight|
//  |Binary Search|Prefix Sum|Data Structure|
//  You are given a 0-indexed array of positive integers w where w[i] describes the weight of the ith index.
//  You need to implement the function pickIndex(), which randomly picks an index in the range [0, w.length - 1] (inclusive) and returns it.
//  The probability of picking an index i is w[i] / sum(w).
//  For example, if w = [1, 3], the probability of picking index 0 is 1 / (1 + 3) = 0.25 (i.e., 25%), and the probability of picking index 1 is 3 / (1 + 3) = 0.75 (i.e., 75%).
//
//  Alt solution: https://en.wikipedia.org/wiki/Alias_method
//

import Foundation

class RandomPickWithWeight {
    
    private let prefixSum: [Int]
    
    init(_ w: [Int]) {
        var prefixSum = [Int]()
        var sum = 0
        
        for num in w {
            sum += num
            prefixSum.append(sum)
        }
        
        self.prefixSum = prefixSum
    }
    
    func pickIndex() -> Int {
        let target = Int.random(in: 1...prefixSum.last!)
        var left = 0
        var right = prefixSum.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if target < prefixSum[mid] { right = mid }
            else if target > prefixSum[mid] { left = mid + 1 }
            else { return mid }
        }
        
        return left
    }
    
}

