//
//  SearchInRotatedSortedArray.swift
//  AlgorithmsExercises
//  Created by hg on 01/06/2022.
//
//  |Search in Rotated Sorted Array|
//  |Binary Search|
//  There is an integer array nums sorted in ascending order (with distinct values).
//  Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].
//  Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
//  You must write an algorithm with O(log n) runtime complexity.
//
                                                                                                        
import Foundation

class SearchInRotatedSortedArray {
    
    func solve(_ nums: [Int], _ target: Int) -> Int {
        var lowerBound = 0
        var upperBound = nums.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            
            if target == nums[mid] { return mid }
            
            if nums[lowerBound] <= nums[mid]  {
                if target > nums[mid] || target < nums[lowerBound] {
                    lowerBound = mid + 1
                }
                else {
                    upperBound = mid - 1
                }
            }
            else {
                if target < nums[mid] || target > nums[upperBound] {
                    upperBound = mid - 1
                }
                else {
                    lowerBound = mid + 1
                }
            }
        }
            
        return -1
    }
    
}
