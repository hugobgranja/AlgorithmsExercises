//
//  MaximalSquare.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Maximal Square|
//  |Matrix|Dynamic Programming|
//  Given an m x n binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
//

import Foundation

class MaximalSquare {
    
    // Top down memoization - O(m * n) time, O(m * n) space
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        @discardableResult
        func helper(_ row: Int, _ col: Int) -> Int {
            if row >= matrix.count || col >= matrix[0].count { return 0 }
            
            if memo[row][col] == -1 {
                let down = helper(row + 1, col)
                let right = helper(row, col + 1)
                let diag = helper(row + 1, col + 1)
                
                memo[row][col] = 0
                if matrix[row][col] == "1" {
                    memo[row][col] = 1 + min(down, right, diag)
                    maxLength = max(maxLength, memo[row][col])
                }
            }
            
            return memo[row][col]
        }
        
        var memo = [[Int]](
            repeating: [Int](repeating: -1, count: matrix[0].count),
            count: matrix.count
        )
        
        var maxLength = 0
        helper(0, 0)
        return maxLength * maxLength
    }
    
    // Bottom up 2D
    func maximalSquare2(_ matrix: [[Character]]) -> Int {
        var memo = [[Int]](
            repeating: [Int](repeating: 0, count: matrix[0].count + 1),
            count: matrix.count + 1
        )
        var maxLength = 0
        
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
                if matrix[i - 1][j - 1] == "1" {
                    memo[i][j] = 1 + min(memo[i][j - 1], memo[i - 1][j], memo[i - 1][j - 1])
                    maxLength = max(maxLength, memo[i][j])
                }
            }
        }
        
        return maxLength * maxLength
    }
    
    // Bottom up 1D
    func maximalSquare3(_ matrix: [[Character]]) -> Int {
        var memo = [Int](repeating: 0, count: matrix[0].count + 1)
        var maxLength = 0
        var prev = 0
        
        for i in 1...matrix.count {
            for j in 1...matrix[0].count {
                let temp = memo[j]
                
                if matrix[i - 1][j - 1] == "1" {
                    memo[j] = 1 + min(prev, memo[j - 1], memo[j])
                    maxLength = max(maxLength, memo[j])
                }
                else {
                    memo[j] = 0
                }
                
                prev = temp
            }
        }
        
        return maxLength * maxLength
    }
    
    // Bottom up 1D Alt
    func maximalSquare4(_ matrix: [[Character]]) -> Int {
            var memo = [Int](repeating: 0, count: matrix[0].count)
            var maxLength = 0
            var prev = 0
            
            for i in matrix.indices {
                for j in matrix[i].indices {
                    let cache = memo[j]
                    
                    if i == 0 || j == 0 || matrix[i][j] == "0" {
                        memo[j] = matrix[i][j] == "1" ? 1 : 0
                    }
                    else {
                        memo[j] = 1 + min(prev, memo[j], memo[j - 1])
                    }
                    
                    maxLength = max(maxLength, memo[j])
                    prev = cache
                }
            }
            
            return maxLength * maxLength
        }
    
}
