//
//  Permutations.swift
//  AlgorithmsExercises
//  Created by hg on 03/06/2022.
//
//  |Permutations|
//  |Backtracking|
//  Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.
//

import Foundation

class Permutations {
    
    // Swaps return elements to original positions
    // Could do swaps without copying if nums was inout param.
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var result = [[Int]]()
        
        func permute(at startIndex: Int) {
            if startIndex == nums.count - 1 { result.append(nums) }
            
            for index in startIndex..<nums.count {
                nums.swapAt(startIndex, index)
                permute(at: startIndex + 1)
                nums.swapAt(index, startIndex)
            }
        }
        
        permute(at: 0)
        return result
    }
    
}
