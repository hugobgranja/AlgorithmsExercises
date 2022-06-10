//
//  MajorityElement.swift
//  AlgorithmsExercises
//  Created by hg on 27/05/2022.
//
//  |Majority Element|
//  |Array|Named Algorithm|
//  Given an array nums of size n, return the majority element.
//  The majority element is the element that appears more than ⌊n / 2⌋ times.
//  You may assume that the majority element always exists in the array.
//  Follow-up: Could you solve the problem in linear time and in O(1) space?
//

import Foundation

class MajorityElement {
    
    // O(n) time/space
    func solve(_ nums: [Int]) -> Int {
        let half = nums.count / 2
        var counts = [Int: Int]()
        
        for num in nums {
            counts[num, default: 0] += 1
            if counts[num]! > half { return num }
        }
        
        return -1
    }
    
    // Boyer-Moore Voting Algorithm - O(n) time (1) space
    func solveBM(_ nums: [Int]) -> Int {
        var count = 0
        var candidate = 0
        
        for num in nums {
            if count == 0 { candidate = num }
            if num == candidate { count += 1 }
            else { count -= 1 }
        }
        
        return candidate
    }
    
}
