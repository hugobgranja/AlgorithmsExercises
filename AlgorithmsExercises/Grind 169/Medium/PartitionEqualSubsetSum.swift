//
//  PartitionEqualSubsetSum.swift
//  AlgorithmsExercises
//  Created by hg on 05/06/2022.
//
//  |Partition Equal Subset Sum|
//  |Dynamic Programming|
//  Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.
//

import Foundation

class PartitionEqualSubsetSum {
    
    func canPartition(_ nums: [Int]) -> Bool {
        let sum = nums.reduce(0, +)
        if !sum.isMultiple(of: 2) { return false }
        let target = sum / 2
        var subsums = Set<Int>()
        subsums.insert(0)
        
        for num in nums {
            for subsum in subsums {
                if subsums.contains(target) { return true }
                let newSum = subsum + num
                if newSum <= target { subsums.insert(subsum + num) }
            }
        }
        
        return subsums.contains(target)
    }
    
}
