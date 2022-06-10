//
//  LongestIncreasingSubsequence.swift
//  AlgorithmsExercises
//  Created by hg on 11/06/2022.
//
//  |Longest Increasing Subsequence|
//  |Dynamic Programming|Greedy|Binary Search|Named Algorithm|Patience Sorting|
//  Given an integer array nums, return the length of the longest strictly increasing subsequence.
//  A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements.
//  For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].
//

import Foundation

class LongestIncreasingSubsequence {
    
    // DP - O(n^2) time, O(n) space
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var lis = [Int](repeating: 1, count: nums.count)
        
        for i in nums.indices.dropLast().reversed() {
            for j in nums.indices.suffix(from: i + 1) {
                if nums[i] < nums[j] {
                    lis[i] = max(lis[i], 1 + lis[j])
                }
            }
        }
        
        return lis.max() ?? 0
    }
    
    // Greedy + Binary Search - O(n log n) time, O(n) space
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        var sub = [Int]()
        
        for num in nums {
            if let subLast = sub.last, subLast >= num {
                let indexOfFirstGTE = firstGTE(sub, num)
                sub[indexOfFirstGTE] = num
            }
            else {
                sub.append(num)
            }
        }
        
        return sub.count
    }
    
    private func firstGTE(_ array: [Int], _ element: Int) -> Int {
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            if element <= array[mid] { upperBound = mid - 1 }
            else { lowerBound = mid + 1 }
        }
        
        return lowerBound
    }
    
}
