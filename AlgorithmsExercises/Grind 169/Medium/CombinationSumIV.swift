//
//  CombinationSumIV.swift
//  AlgorithmsExercises
//  Created by hg on 23/06/2022.
//
//  |Combination Sum IV|
//  |Dynamic Programming|
//  Given an array of distinct integers nums and a target integer target, return the number of possible combinations that add up to target.
//  The test cases are generated so that the answer can fit in a 32-bit integer.
//

import Foundation

class CombinationSumIV {
    
    // Generates combinations
    func combinationSum4gen(_ nums: [Int], _ target: Int) -> [[Int]] {
        func dfs( _ target: Int) {
            if target < 0 { return }
            
            if target == 0 {
                result.append(path)
                return
            }
            
            for num in nums {
                path.append(num)
                dfs(target - num)
                path.removeLast()
            }
        }
        
        var path = [Int]()
        var result = [[Int]]()
        dfs(target)
        return result
    }
    
    // Top-down
    func combinationSum4TD(_ nums: [Int], _ target: Int) -> Int {
        func dfs( _ target: Int) -> Int {
            if target < 0 { return 0 }
            if memo[target] != -1 { return memo[target] }
            memo[target] = nums.reduce(0) { $0 + dfs(target - $1) }
            return memo[target]
        }
        
        var memo = [1] + [Int](repeating: -1, count: target)
        return dfs(target)
    }
    
    // Bottom-up
    // Causes arithmetic overflow by computing large numbers that do not contribute to the final solution
    func combinationSum4BU(_ nums: [Int], _ target: Int) -> Int {
        var memo = [0: 1]
                
        for remaining in 1...target {
            memo[remaining] = nums.reduce(0) { $0 + memo[remaining - $1, default: 0] }
        }
        
        return memo[target] ?? -1
    }
    
}
