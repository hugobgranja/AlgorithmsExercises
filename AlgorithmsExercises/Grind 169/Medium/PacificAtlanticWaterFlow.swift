//
//  PacificAtlanticWaterFlow.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Pacific Atlantic Water Flow|
//  |Matrix|DFS|BFS|
//  There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean.
//  The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.
//  The island is partitioned into a grid of square cells.
//  You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).
//  The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height.
//  Water can flow from any cell adjacent to an ocean into the ocean.
//  Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.
//

import Foundation

class PacificAtlanticWaterFlow {
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        func adjacent(to coordinate: Coordinate) -> [Coordinate] {
            let (row, col) = (coordinate.row, coordinate.col)
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<heights.count).contains($0) &&
                    (0..<heights[0].count).contains($1)
                }
                .map { Coordinate(row: $0, col: $1) }
        }
        
        func dfs(_ coordinate: Coordinate, visited: inout Set<Coordinate>, _ currentHeight: Int) {
            visited.insert(coordinate)
            
            for neighbor in adjacent(to: coordinate) where !visited.contains(neighbor) {
                let neighborHeight = heights[neighbor.row][neighbor.col]
                if neighborHeight >= currentHeight {
                    dfs(neighbor, visited: &visited, neighborHeight)
                }
            }
        }
        
        let lastRowIndex = heights.count - 1
        let lastColIndex = heights[0].count - 1
        var reachedPacific = Set<Coordinate>()
        var reachedAtlantic = Set<Coordinate>()
        
        for index in 0..<heights.count {
            let pacificCoord = Coordinate(row: index, col: 0)
            let pacificHeight = heights[index][0]
            dfs(pacificCoord, visited: &reachedPacific, pacificHeight)
            
            let atlanticCoord = Coordinate(row: index, col: lastColIndex)
            let atlanticHeight = heights[index][lastColIndex]
            dfs(atlanticCoord, visited: &reachedAtlantic, atlanticHeight)
        }
        
        for index in 0..<heights[0].count {
            let pacificCoord = Coordinate(row: 0, col: index)
            let pacificHeight = heights[0][index]
            dfs(pacificCoord, visited: &reachedPacific, pacificHeight)
            
            let atlanticCoord = Coordinate(row: lastRowIndex, col: index)
            let atlanticHeight = heights[lastRowIndex][index]
            dfs(atlanticCoord, visited: &reachedAtlantic, atlanticHeight)
        }
        
        return [Coordinate](reachedPacific.intersection(reachedAtlantic)).map { [$0.row, $0.col] }
    }
    
}
