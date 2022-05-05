//
//  ClimbingStaircase.swift
//  AlgorithmsExercises
//
//  Created by hg on 18/05/2022.
//
//  You need to climb a staircase that has n steps, and you decide to get some extra exercise by jumping up the steps.
//  You can cover at most k steps in a single jump.
//  Return all the possible sequences of jumps that you could take to climb the staircase, sorted.
//

import Foundation

class ClimbingStaircase {
    
    func solve(n: Int, k: Int) -> [[Int]] {
        guard k > 0 else { return [[]] }
        
        var result = [[Int]]()
        
        for step in 1...k {
            let remainingStairs = n - step
            let possibleSteps = min(remainingStairs, k)
            let combinations = solve(n: remainingStairs, k: possibleSteps)
            
            for combination in combinations {
                result.append([step] + combination)
            }
        }
        
        return result
    }
    
}
