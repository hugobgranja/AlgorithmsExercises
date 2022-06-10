//
//  TwoSumLT.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//
//  |Two Sum|
//  |Array|Hash Table|
//  Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
//  You may assume that each input would have exactly one solution, and you may not use the same element twice.
//  You can return the answer in any order.
//

import Foundation

class TwoSumLT {
    
    func solve(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        
        for (index, element) in nums.enumerated() {
            let complement = target - element
            
            if let complementIndex = map[complement] {
                return [complementIndex, index]
            }
            
            map[element] = index
        }
        
        return []
    }
    
}
