//
//  ThreeSumClosest.swift
//  AlgorithmsExercises
//  Created by hg on 22/06/2022.
//
//  |3Sum Closest|
//  |Array|Two Pointers|Sorting|
//  Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.
//  Return the sum of the three integers.
//  You may assume that each input would have exactly one solution.
//

import Foundation

class ThreeSumClosest {
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        var closest = nums[0] + nums[1] + nums[2]

        for (i, num) in nums.enumerated().dropLast(2) {
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = num + nums[left] + nums[right]
                
                if sum == target { return sum }
                
                if abs(sum - target) < abs(closest - target) {
                   closest = sum
                }
                
                if sum < target {
                    left += 1
                }
                else {
                    right -= 1
                }
            }
        }

        return closest
    }
    
}
