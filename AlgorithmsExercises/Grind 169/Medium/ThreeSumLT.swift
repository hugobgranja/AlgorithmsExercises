//
//  ThreeSumLT.swift
//  AlgorithmsExercises
//  Created by hg on 30/05/2022.
//
//  |3Sum|
//  |Array|Two Pointers|Sorting|
//  Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
//  Notice that the solution set must not contain duplicate triplets.
//

import Foundation

class ThreeSumLT {
    
    func solve(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()

        for (i, num) in nums.enumerated().dropLast(2) {
            if i > 0 && num == nums[i - 1] { continue }
            
            var left = i + 1
            var right = nums.count - 1
            
            while left < right {
                let sum = num + nums[left] + nums[right]
                
                if sum > 0 {
                    right -= 1
                }
                else if sum < 0 {
                    left += 1
                }
                else {
                    result.append([num, nums[left], nums[right]])
                    
                    left += 1
                    while nums[left] == nums[left - 1] && left < right {
                        left += 1
                    }
                }
            }
        }

        return result
    }
    
}
