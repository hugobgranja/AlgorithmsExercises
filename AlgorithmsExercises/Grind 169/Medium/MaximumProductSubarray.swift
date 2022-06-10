//
//  MaximumProductSubarray.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Maximum Product Subarray|
//  |Dynamic Programming|
//  Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.
//  The test cases are generated so that the answer will fit in a 32-bit integer.
//  A subarray is a contiguous subsequence of the array.
//

import Foundation

class MaximumProductSubarray {
    
    func maxProduct(_ nums: [Int]) -> Int {
        var result = nums[0]
        var minProd = nums[0]
        var maxProd = nums[0]
        
        for num in nums.dropFirst() {
            let currentMin = minProd * num
            let currentMax = maxProd * num
            minProd = min(num, currentMin, currentMax)
            maxProd = max(num, currentMin, currentMax)
            result = max(result, maxProd)
        }
        
        return result
    }
    
}
