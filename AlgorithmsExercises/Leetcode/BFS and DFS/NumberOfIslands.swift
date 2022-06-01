//
//  NumberOfIslands.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/06/2022.
//
//  Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
//  An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.
//  You may assume all four edges of the grid are all surrounded by water.
//

import Foundation

class NumberOfIslands {
    
    // Notes:
    // Similar to finding connected components in a graph
    // If grid is mutable can set visited state on the grid itself
    func solve(_ grid: [[Character]]) -> Int {
        if grid.isEmpty { return 0 }
        
        var visited = [[Bool]](
            repeating: [Bool](repeating: false, count: grid[0].count),
            count: grid.count
        )
        
        func landAdjacentTo(_ row: Int, _ col: Int) -> [(Int, Int)] {
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter { row, col in
                    (0..<grid.count).contains(row) &&
                    (0..<grid[0].count).contains(col) &&
                    grid[row][col] == "1"
                }
        }
        
        func bfs(_ row: Int, _ col: Int) {
            var queue = [(row, col)]
            visited[row][col] = true
            
            while let (row, col) = queue.first {
                queue.removeFirst()
                
                for (nRow, nCol) in landAdjacentTo(row, col) {
                    if !visited[nRow][nCol] {
                        queue.append((nRow, nCol))
                        visited[nRow][nCol] = true
                    }
                }
            }
        }
        
        var islandCount = 0
        for (row, array) in grid.enumerated() {
            for (col, terrain) in array.enumerated() {
                if terrain == "1" && !visited[row][col] {
                    bfs(row, col)
                    islandCount += 1
                }
            }
        }
        
        return islandCount
    }
    
}
