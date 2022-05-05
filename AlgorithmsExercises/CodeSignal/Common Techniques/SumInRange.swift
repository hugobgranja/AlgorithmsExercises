//
//  SumInRange.swift
//  AlgorithmsExercises
//
//  Created by hg on 22/05/2022.
//
//  You have an array of integers nums and an array queries, where queries[i] is a pair of indices (0-based).
//  Find the sum of the elements in nums from the indices at queries[i][0] to queries[i][1] (inclusive) for each query, then add all of the sums for all the queries together.
//  Return that number modulo 10^9 + 7.
//
//  Alternate solution:
//  Create disjoint sets of queries as in SwapLexOrder
//  Keeping a multiplier is needed for repeated indices
//

import Foundation

class SumInRange {
    
    func solveNaive(nums: [Int], queries: [[Int]]) -> Int {
        var sum = 0
        
        for query in queries {
            for index in query[0]...query[1] {
                sum += nums[index]
            }
        }
        
        return mod(sum)
    }
    
    func solve(nums: [Int], queries: [[Int]]) -> Int {
        var sums = [Int]()
        var sum = 0
            
        for num in nums {
            sum = mod(sum + num)
            sums.append(sum)
        }
        
        sum = 0
        
        for query in queries {
            if query[0] == 0 { sum = mod(sum + sums[query[1]]) }
            else {
                sum = mod(sum + sums[query[1]] - sums[query[0] - 1])
            }
        }

        return sum
    }
    
    private func mod(_ first: Int) -> Int {
        let second = 1000000007
        if first >= 0 { return first % second }
        if first >= -second { return first + second }
        return ((first % second) + second) % second
    }
    
}
