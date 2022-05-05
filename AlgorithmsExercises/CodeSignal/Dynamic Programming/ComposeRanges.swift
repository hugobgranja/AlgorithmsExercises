//
//  ComposeRanges.swift
//  AlgorithmsExercises
//
//  Created by hg on 20/05/2022.
//
//  Given a sorted integer array that does not contain any duplicates, return a summary of the number ranges it contains.
//
//  Example
//  For nums = [-1, 0, 1, 2, 6, 7, 9], the output should be
//  solution(nums) = ["-1->2", "6->7", "9"].
//

import Foundation

class ComposeRanges {
    
    func solve(nums: [Int]) -> [String] {
        var result = [String]()
        var index = 0
        
        while index < nums.count {
            let first = nums[index]
            var last: Int?
            
            index += 1
            
            while index < nums.count && nums[index] - nums[index - 1] == 1 {
                last = nums[index]
                index += 1
            }
            
            if let last = last { result.append("\(first)->\(last)") }
            else { result.append("\(first)") }
        }
        
        return result
    }
    
}
