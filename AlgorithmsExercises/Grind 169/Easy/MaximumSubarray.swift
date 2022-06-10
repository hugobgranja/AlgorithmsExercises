//
//  MaximumSubarray.swift
//  AlgorithmsExercises
//  Created by hg on 25/05/2022.
//
//  |Maximum Subarray|
//  |Array|Greedy|
//  Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
//  A subarray is a contiguous part of an array.
//

import Foundation

class MaximumSubarray {
    
    func solve(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var currentSum = nums[0]
        
        for num in nums.dropFirst() {
            currentSum += num
            if num > currentSum { currentSum = num }
            if currentSum > maxSum { maxSum = currentSum }
        }
        
        return maxSum
    }
    
}
