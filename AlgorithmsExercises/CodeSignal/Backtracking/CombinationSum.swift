//
//  CombinationSum.swift
//  AlgorithmsExercises
//  Created by hg on 19/05/2022.
//
//  Given an array of integers a and an integer sum, find all of the unique combinations in a that add up to sum.
//  The same number from a can be used an unlimited number of times in a combination.
//  Elements in a combination (a1 a2 … ak) must be sorted in non-descending order, while the combinations themselves must be sorted in ascending order.
//  If there are no possible combinations that add up to sum, the output should be the string "Empty".
//

import Foundation

class CombinationSum {
    
    func solve(a: [Int], sum: Int) -> String {
        let result = solveList(a: Set(a).sorted(), sum: sum)
        
        if result.isEmpty { return "Empty" }
        
        return result
            .map { $0.map { String($0) } }
            .map { "(" + $0.joined(separator: " ") + ")" }
            .joined()
    }
    
    func solveList<T: Collection>(a: T, sum: Int) -> [[Int]] where T.Element == Int {
        if sum == 0 { return [[]] }
        else if let first = a.first, first > sum { return [] }
        
        var result = [[Int]]()
        var index = a.startIndex
        
        while index < a.endIndex, a[index] <= sum {
            let combinations = solveList(a: a.suffix(from: index), sum: sum - a[index])
            
            for combination in combinations {
                result.append([a[index]] + combination)
            }
            
            index = a.index(after: index)
        }
        
        return result
    }
    
}
