//
//  CombinationSumII.swift
//  AlgorithmsExercises
//  Created by hg on 12/07/2022.
//
//  |Combination Sum II|
//  |Backtracking|
//  Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.
//  Each number in candidates may only be used once in the combination.
//  Note: The solution set must not contain duplicate combinations.
//

import Foundation

class CombinationSumII {
    
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        
        func dfs(_ index: Int, _ target: Int) {
            guard target >= 0 else { return }
            
            if target == 0 {
                result.append(combination)
                return
            }
            
            for i in candidates.indices.suffix(from: index) {
                if i > index && candidates[i] == candidates[i - 1] {
                    continue
                }
                
                combination.append(candidates[i])
                dfs(i + 1, target - candidates[i])
                combination.removeLast()
            }
        }
        
        var result = [[Int]]()
        var combination = [Int]()
        dfs(0, target)
        return result
    }
    
}
