//
//  MoveZeroes.swift
//  AlgorithmsExercises
//  Created by hg on 29/05/2022.
//
//  |Move Zeroes|
//  |Array|Two Pointers|
//  Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//  Note that you must do this in-place without making a copy of the array.
//

import Foundation

class MoveZeroes {
    
    // O(n) time, O(n) space
    func solve(_ nums: inout [Int]) {
        let zeroCount = nums.reduce(0) { $0 + ($1 == 0 ? 1 : 0) }
        nums = nums.filter { $0 != 0 } + [Int](repeating: 0, count: zeroCount)
    }
    
    // O(n) time, O(1) space
    func solve2(_ nums: inout [Int]) {
        var lastNonZeroIndex = 0
        
        for index in nums.indices {
            if nums[index] != 0 {
                nums[lastNonZeroIndex] = nums[index]
                lastNonZeroIndex += 1
            }
        }
        
        for index in lastNonZeroIndex..<nums.count {
            nums[index] = 0
        }
    }
    
    // O(n) time, O(1) space - Better complexity with higher number of zeroes
    func solve3(_ nums: inout [Int]) {
        var lastNonZeroIndex = 0
        
        for index in nums.indices {
            if nums[index] != 0 {
                nums.swapAt(lastNonZeroIndex, index)
                lastNonZeroIndex += 1
            }
        }
    }
    
}
