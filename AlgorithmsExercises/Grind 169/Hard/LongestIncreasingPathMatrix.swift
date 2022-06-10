//
//  LongestIncreasingPathMatrix.swift
//  AlgorithmsExercises
//  Created by hg on 04/07/2022.
//
//  |Longest Increasing Path in a Matrix|
//  |Matrix|Dynamic Programming|DFS|Memoization|BFS|Graph|Topological Sort|
//  Given an m x n integers matrix, return the length of the longest increasing path in matrix.
//  From each cell, you can either move in four directions: left, right, up, or down.
//  You may not move diagonally or move outside the boundary (i.e., wrap-around is not allowed).
//

import Foundation

class LongestIncreasingPathMatrix {
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        func adjacent(_ row: Int, _ col: Int) -> [(Int, Int)] {
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<matrix.count).contains($0) &&
                    (0..<matrix[0].count).contains($1)
                }
        }
        
        @discardableResult
        func dfs(_ row: Int, _ col: Int) -> Int {
            if memo[row][col] > 0 { return memo[row][col] }
            var count = 1
            
            for (adjRow, adjCol) in adjacent(row, col) {
                if matrix[row][col] < matrix[adjRow][adjCol] {
                    count = max(count, 1 + dfs(adjRow, adjCol))
                }
            }
            
            memo[row][col] = count
            return count
        }
        
        var memo = [[Int]](
            repeating: [Int](repeating: 0, count: matrix[0].count),
            count: matrix.count
        )
        
        var longestCount = 0
        
        for row in matrix.indices {
            for col in matrix[row].indices {
                longestCount = max(longestCount, dfs(row, col))
            }
        }
        
        return longestCount
    }
    
}
