//
//  JumpGame.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Jump Game|
//  |Dynamic Programming|Greedy|
//  You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
//  Return true if you can reach the last index, or false otherwise.
//

import Foundation

class JumpGame {
    
    // DP - O(n) time, O(n) space
    func canJump(_ nums: [Int]) -> Bool {
        var isVisited = [Bool](repeating: false, count: nums.count)
        var stack = [0]
        
        while let current = stack.popLast(), !isVisited.last! {
            isVisited[current] = true
            
            guard nums[current] > 0 else { continue }
            for jump in 1...nums[current] {
                let nextPlace = current + jump
                
                if nextPlace < nums.count && !isVisited[nextPlace] {
                    stack.append(current + jump)
                }
            }
        }
        
        return isVisited.last!
    }
    
    // Greedy - O(n) time
    func canJump2(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1
        
        for index in nums.indices.dropLast().reversed() {
            if index + nums[index] >= goal { goal = index }
        }
        
        return goal == 0
    }
    
}
