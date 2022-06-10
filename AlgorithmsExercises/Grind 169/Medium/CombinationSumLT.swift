//
//  CombinationSumLT.swift
//  AlgorithmsExercises
//  Created by hg on 01/06/2022.
//
//  |Combination Sum|
//  |Backtracking|
//  Given an array of distinct integers candidates and a target integer target, return a list of all unique combinations of candidates where the chosen numbers sum to target.
//  You may return the combinations in any order.
//  The same number may be chosen from candidates an unlimited number of times.
//  Two combinations are unique if the frequency of at least one of the chosen numbers is different.
//  It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.
//

import Foundation

class CombinationSumLT {
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        return combinationSumAux(candidates.sorted(), target)
    }
    
    private func combinationSumAux<T: Collection>(_ a: T, _ sum: Int) -> [[Int]] where T.Element == Int {
        if sum == 0 { return [[]] }
        else if let first = a.first, first > sum { return [] }
        
        var result = [[Int]]()
        var index = a.startIndex
        
        while index < a.endIndex, a[index] <= sum {
            let combinations = combinationSumAux(a.suffix(from: index), sum - a[index])
            
            for combination in combinations {
                result.append([a[index]] + combination)
            }
            
            index = a.index(after: index)
        }
        
        return result
    }
    
    func combinationSum2<T: Collection>(_ candidates: T, _ target: Int) -> [[Int]] where T.Element == Int {
        if target == 0 { return [[]] }
        else if target < 0 || candidates.isEmpty { return [] }
        
        var result = [[Int]]()
        
        for (index, candidate) in zip(candidates.indices, candidates) {
            let combinations = combinationSum2(
                candidates.suffix(from: index),
                target - candidate
            )
            
            for combination in combinations {
                result.append([candidate] + combination)
            }
        }
        
        return result
    }
    
    func combinationSum3(_ candidates: [Int], _ target: Int) -> [[Int]] {
        func dfs<T: Collection>(_ candidates: T, _ target: Int) where T.Element == Int {
            if target < 0 || candidates.isEmpty { return }
            
            if target == 0 {
                result.append(path)
                return
            }
            
            for (index, candidate) in zip(candidates.indices, candidates) {
                path.append(candidate)
                dfs(candidates.suffix(from: index), target - candidate)
                path.removeLast()
            }
        }
        
        var path = [Int]()
        var result = [[Int]]()
        dfs(candidates, target)
        return result
    }
    
}
