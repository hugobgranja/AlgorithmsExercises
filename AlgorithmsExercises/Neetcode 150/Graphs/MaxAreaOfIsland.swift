//
//  MaxAreaOfIsland.swift
//  AlgorithmsExercises
//  Created by hg on 15/07/2022.
//
//  |Max Area of Island|
//  |Matrix|DFS|
//  You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
//  The area of an island is the number of cells with a value 1 in the island.
//  Return the maximum area of an island in grid. If there is no island, return 0.
//

import Foundation

class MaxAreaOfIsland {
    
    private struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        func adjacent(to coordinate: Coordinate) -> [Coordinate] {
            let (row, col) = (coordinate.row, coordinate.col)
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<grid.count).contains($0) &&
                    (0..<grid[0].count).contains($1)
                }
                .map { Coordinate(row: $0, col: $1) }
        }
        
        func dfs(_ coord: Coordinate) -> Int {
            visited.insert(coord)
            
            var maxArea = 0
            for neighbor in adjacent(to: coord) {
                if grid[neighbor.row][neighbor.col] == 1 && !visited.contains(neighbor) {
                    maxArea += 1 + dfs(neighbor)
                }
            }
            
            return maxArea
        }
        
        var visited = Set<Coordinate>()
        var maxArea = 0
        
        for (rowIndex, row) in grid.enumerated() {
            for (colIndex, col) in row.enumerated() where col == 1 {
                let coord = Coordinate(row: rowIndex, col: colIndex)
                if !visited.contains(coord) {
                    let area = 1 + dfs(coord)
                    maxArea = max(maxArea, area)
                }
            }
        }
        
        return maxArea
    }
    
}
