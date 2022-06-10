//
//  FindTheDuplicateNumber.swift
//  AlgorithmsExercises
//  Created by hg on 11/06/2022.
//
//  |Find the Duplicate Number|
//  |Array|Two Pointers|Named Algorithm|
//  Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
//  There is only one repeated number in nums, return this repeated number.
//  You must solve the problem without modifying the array nums and uses only constant extra space.
//

import Foundation

class FindTheDuplicateNumber {
    
    // Floyd's tortoise and hare algorithm
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        slow = nums[0]
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }
        
        return slow
    }
    
}
