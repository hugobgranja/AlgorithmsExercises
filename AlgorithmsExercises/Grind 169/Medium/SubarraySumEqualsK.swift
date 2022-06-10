//
//  SubarraySumEqualsK.swift
//  AlgorithmsExercises
//  Created by hg on 16/06/2022.
//
//  |Subarray Sum Equals K|
//  |Hash Table|Prefix Sum|
//  Given an array of integers nums and an integer k, return the total number of subarrays whose sum equals to k.
//  A subarray is a contiguous non-empty sequence of elements within an array.
//

import Foundation

class SubarraySumEqualsK {
    
    // O(n^2)
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        
        for start in nums.indices {
            var sum = 0
            
            for end in start..<nums.count {
                sum += nums[end]
                if sum == k { count += 1}
            }
        }
        
        return count
    }
    
    // O(n) time, O(n) space
    func subarraySum2(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var map = [0: 1]
        
        for num in nums {
            sum += num
            count += map[sum - k, default: 0]
            map[sum, default: 0] += 1
        }
        
        return count
    }
    
}
