//
//  RottingOranges.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/06/2022.
//
//  You are given an m x n grid where each cell can have one of three values:
//  0 representing an empty cell
//  1 representing a fresh orange
//  2 representing a rotten orange
//  Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
//  Return the minimum number of minutes that must elapse until no cell has a fresh orange.
//  If this is impossible, return -1.
//

import Foundation

class RottingOranges {
    
    // Multiple source BFS
    func solve(_ grid: [[Int]]) -> Int {
        var visited = [[Bool]](
            repeating: [Bool](repeating: false, count: grid[0].count),
            count: grid.count
        )
        
        var timeToRotten = [[Int?]](
            repeating: [Int?](repeating: nil, count: grid[0].count),
            count: grid.count
        )
        
        var queue = [(Int, Int)]()
        for (row, array) in grid.enumerated() {
            for (col, orange) in array.enumerated() {
                if orange == 2 {
                    queue.append((row, col))
                    visited[row][col] = true
                    timeToRotten[row][col] = 0
                }
            }
        }
        
        while let (row, col) = queue.first {
            queue.removeFirst()
            
            for (nRow, nCol) in freshOrangesAdjacentTo(row, col, grid) {
                if !visited[nRow][nCol] {
                    queue.append((nRow, nCol))
                    visited[nRow][nCol] = true
                    timeToRotten[nRow][nCol] = 1 + timeToRotten[row][col]!
                }
            }
        }
        
        var maxDistance = 0
        for (row, array) in timeToRotten.enumerated() {
            for (col, distance) in array.enumerated() {
                if let distance = distance {
                    maxDistance = max(maxDistance, distance)
                }
                else {
                    if grid[row][col] == 1 { return -1 }
                }
            }
        }
        
        return maxDistance
    }
    
    func solve2(_ grid: [[Int]]) -> Int {
        var visited = [[Bool]](
            repeating: [Bool](repeating: false, count: grid[0].count),
            count: grid.count
        )
        
        var fresh = 0
        var queue = [(Int, Int)]()
        for (row, array) in grid.enumerated() {
            for (col, orange) in array.enumerated() {
                if orange == 1 { fresh += 1 }
                else if orange == 2 { queue.append((row, col)) }
            }
        }
        
        var time = 0
        while !queue.isEmpty, fresh > 0 {
            for _ in 0..<queue.count {
                let (row, col) = queue.removeFirst()
                
                for (nRow, nCol) in freshOrangesAdjacentTo(row, col, grid) {
                    if !visited[nRow][nCol] {
                        queue.append((nRow, nCol))
                        visited[nRow][nCol] = true
                        fresh -= 1
                    }
                }
            }
            
            time += 1
        }
        
        return fresh == 0 ? time : -1
    }
    
    private func freshOrangesAdjacentTo(_ row: Int, _ col: Int, _ grid: [[Int]]) -> [(Int, Int)] {
        return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
            .filter { row, col in
                (0..<grid.count).contains(row) &&
                (0..<grid[0].count).contains(col) &&
                grid[row][col] == 1
            }
    }
    
}
