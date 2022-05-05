//
//  ClimbingStairsDP.swift
//  AlgorithmsExercises
//
//  Created by hg on 19/05/2022.
//
//  You are climbing a staircase that has n steps.
//  You can take the steps either 1 or 2 at a time.
//  Calculate how many distinct ways you can climb to the top of the staircase.
//

import Foundation

class ClimbingStairsDP {
    
    func solve(n: Int) -> Int {
        var a = 1, b = 1
        
        for _ in 0..<n {
            let temp = a
            a = b
            b = temp + b
        }

        return a
    }

}
