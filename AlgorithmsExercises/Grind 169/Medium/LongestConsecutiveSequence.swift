//
//  LongestConsecutiveSequence.swift
//  AlgorithmsExercises
//  Created by hg on 13/06/2022.
//
//  |Longest Consecutive Sequence|
//  |Array|Hash Table|
//  Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
//  You must write an algorithm that runs in O(n) time.
//

import Foundation

class LongestConsecutiveSequence {
    
    func longestConsecutive(_ nums: [Int]) -> Int {
        let numSet = Set<Int>(nums)
        var longest = 0
        
        for num in nums where !numSet.contains(num - 1) {
            var length = 1
            
            while numSet.contains(num + length) {
                length += 1
            }
            
            longest = max(longest, length)
        }
        
        return longest
    }
    
}
