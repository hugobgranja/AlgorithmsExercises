//
//  UniquePaths.swift
//  AlgorithmsExercises
//  Created by hg on 07/06/2022.
//
//  |Unique Paths|
//  |Dynamic Programming|Combinatorics|
//  There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]).
//  The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]).
//  The robot can only move either down or right at any point in time.
//  Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.
//  The test cases are generated so that the answer will be less than or equal to 2 * 109.
//

import Foundation

class UniquePaths {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memoRow = [Int](repeating: 1, count: n)
        
        for _ in 1..<m {
            for col in 1..<n {
                memoRow[col] += memoRow[col - 1]
            }
        }
        
        return memoRow[n - 1]
    }
    
}
