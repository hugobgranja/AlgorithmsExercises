//
//  NextPermutation.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Next Permutation|
//  |Array|Two Pointers|
//  The next permutation of an array of integers is the next lexicographically greater permutation of its integer.
//  Given an array of integers nums, find the next permutation of nums.
//  The replacement must be in place and use only constant extra memory.
//

import Foundation

class NextPermutation {
    
    func nextPermutation(_ nums: inout [Int]) {
        var index = nums.count - 2
        
        while index >= 0 && nums[index + 1] <= nums[index] {
            index -= 1
        }
        
        if index >= 0 {
            var j = nums.count - 1
            while nums[j] <= nums[index] {
                j -= 1
            }
            
            nums.swapAt(index, j)
        }
        
        reverse(&nums, from: index + 1)
    }
    
    private func reverse(_ nums: inout [Int], from index: Int) {
        var left = index
        var right = nums.count - 1
        
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
}
