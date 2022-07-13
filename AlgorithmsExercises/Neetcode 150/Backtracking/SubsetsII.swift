//
//  SubsetsII.swift
//  AlgorithmsExercises
//  Created by hg on 12/07/2022.
//
//  |Subsets II|Power Set|
//  |Backtracking|
//  Given an integer array nums that may contain duplicates, return all possible subsets (the power set).
//  The solution set must not contain duplicate subsets. Return the solution in any order.
//

import Foundation

class SubsetsII {
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        
        func dfs(_ index: Int) {
            guard index < nums.count else {
                result.append(subset)
                return
            }
            
            // All subsets that include nums[index]
            subset.append(nums[index])
            dfs(index + 1)
            subset.removeLast()
            
            // All subsets that do not include nums[index]
            var nextIndex = index + 1
            while nextIndex < nums.count && nums[index] == nums[nextIndex] {
                nextIndex += 1
            }
            dfs(nextIndex)
        }
        
        var subset = [Int]()
        var result = [[Int]]()
        dfs(0)
        return result
    }
    
}
