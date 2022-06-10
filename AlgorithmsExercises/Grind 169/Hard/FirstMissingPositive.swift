//
//  FirstMissingPositive.swift
//  AlgorithmsExercises
//  Created by hg on 09/07/2022.
//
//  |First Missing Positive|
//  |Array|
//  Given an unsorted integer array nums, return the smallest missing positive integer.
//  You must implement an algorithm that runs in O(n) time and uses constant extra space.
//

import Foundation

class FirstMissingPositive {
    
    func firstMissingPositive(_ nums: inout [Int]) -> Int {
        for index in nums.indices where nums[index] < 0 {
            nums[index] = 0
        }
        
        for index in nums.indices {
            let val = abs(nums[index])
            
            if (1...nums.count).contains(val) {
                if nums[val - 1] > 0 {
                    nums[val - 1] *= -1
                }
                else if nums[val - 1] == 0 {
                    nums[val - 1] = -1 * (nums.count + 1)
                }
            }
        }
        
        for i in 1...nums.count where nums[i - 1] >= 0 {
            return i
        }
        
        return nums.count + 1
    }
    
}
