//
//  SudokuSolver.swift
//  AlgorithmsExercises
//  Created by hg on 09/07/2022.
//
//  |Sudoku Solver|
//  |Matrix|Backtracking|
//  Write a program to solve a Sudoku puzzle by filling the empty cells.
//  A sudoku solution must satisfy all of the following rules:
//  Each of the digits 1-9 must occur exactly once in each row.
//  Each of the digits 1-9 must occur exactly once in each column.
//  Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
//  The '.' character indicates empty cells.
//

import Foundation

class SudokuSolver {
    
    func solveSudoku(_ board: inout [[Character]]) {
        func isValidPlacement(_ row: Int, _ col: Int, _ char: Character) -> Bool {
            for index in 0..<9 {
                if board[row][index] == char || board[index][col] == char { return false }
            }
            
            let y = (row / 3) * 3
            let x = (col / 3) * 3
            
            for i in 0..<3 {
                for j in 0..<3 where board[y + i][x + j] == char {
                    return false
                }
            }
            
            return true
        }
        
        func solve() {
            for row in 0..<9 {
                for col in 0..<9 {
                    if board[row][col] == "." {
                        for num in 1...9 {
                            let char = Character(String(num))
                            if isValidPlacement(row, col, char) {
                                board[row][col] = char
                                solve()
                                if solved { return }
                                board[row][col] = "."
                            }
                        }
                        
                        return
                    }
                }
            }
            
            solved = true
        }
        
        var solved = false
        solve()
    }
    
}
