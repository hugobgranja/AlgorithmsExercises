//
//  Subsets.swift
//  AlgorithmsExercises
//  Created by hg on 06/06/2022.
//
//  |Subsets|Power Set|
//  |Dynamic Programming|
//  Given an integer array nums of unique elements, return all possible subsets (the power set).
//  The solution set must not contain duplicate subsets. Return the solution in any order.
//

import Foundation

class Subsets {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append([])
        
        for num in nums {
            for index in 0..<result.count {
                result.append(result[index] + [num])
            }
        }
        
        return result
    }
    
}
