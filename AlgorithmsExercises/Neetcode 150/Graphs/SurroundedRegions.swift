//
//  SurroundedRegions.swift
//  AlgorithmsExercises
//  Created by hg on 17/07/2022.
//
//  |Surrounded Regions|
//  |Matrix|DFS|
//  Given an m x n matrix board containing 'X' and 'O', capture all regions that are 4-directionally surrounded by 'X'.
//  A region is captured by flipping all 'O's into 'X's in that surrounded region.
//

import Foundation

class SurroundedRegions {
    
    func solve(_ board: inout [[Character]]) {
        captureUnsurroundedRegions(&board)
        captureSurroundedRegions(&board)
        uncaptureUnsurroundedRegions(&board)
    }
    
    // O -> T
    private func captureUnsurroundedRegions(_ board: inout [[Character]]) {
        func adjacentTo(_ row: Int, _ col: Int) -> [(Int, Int)] {
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<board.count).contains($0) &&
                    (0..<board[0].count).contains($1)
                }
        }
        
        func dfs(_ row: Int, _ col: Int) {
            guard board[row][col] == "O" else { return }
            board[row][col] = "T"
            for (adjRow, adjCol) in adjacentTo(row, col) {
                dfs(adjRow, adjCol)
            }
        }
        
        func isOnBorder(_ row: Int, _ col: Int) -> Bool {
            return [0,board.count - 1].contains(row) || [0, board[0].count - 1].contains(col)
        }
        
        for (rowIndex, row) in board.enumerated() {
            for (colIndex, col) in row.enumerated() {
                if col == "O" && isOnBorder(rowIndex, colIndex) {
                    dfs(rowIndex, colIndex)
                }
            }
        }
    }
    
    // O -> X
    private func captureSurroundedRegions(_ board: inout [[Character]]) {
        for (rowIndex, row) in board.enumerated() {
            for (colIndex, col) in row.enumerated() {
                if col == "O" {
                    board[rowIndex][colIndex] = "X"
                }
            }
        }
    }
    
    // T -> O
    private func uncaptureUnsurroundedRegions(_ board: inout [[Character]]) {
        for (rowIndex, row) in board.enumerated() {
            for (colIndex, col) in row.enumerated() {
                if col == "T" {
                    board[rowIndex][colIndex] = "O"
                }
            }
        }
    }
    
}
