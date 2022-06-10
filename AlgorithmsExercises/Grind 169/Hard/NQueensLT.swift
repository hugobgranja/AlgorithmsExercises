//
//  NQueensLT.swift
//  AlgorithmsExercises
//  Created by hg on 09/07/2022.
//
//  |N-Queens|
//  |Backtracking|
//  The n-queens puzzle is the problem of placing n queens on an n x n chessboard such that no two queens attack each other.
//  Given an integer n, return all distinct solutions to the n-queens puzzle.
//  You may return the answer in any order.
//  Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space, respectively.
//

import Foundation

class NQueensLT {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        func backtrack(_ row: Int) {
            if row == n {
                result.append(board.map { $0.joined() })
                return
            }
            
            for col in 0..<n {
                if !colSet.contains(col) && !posDiagSet.contains(row + col) && !negDiagSet.contains(row - col) {
                    colSet.insert(col)
                    posDiagSet.insert(row + col)
                    negDiagSet.insert(row - col)
                    board[row][col] = "Q"
                    
                    backtrack(row + 1)
                    
                    colSet.remove(col)
                    posDiagSet.remove(row + col)
                    negDiagSet.remove(row - col)
                    board[row][col] = "."
                }
            }
        }
        
        var colSet = Set<Int>()
        var posDiagSet = Set<Int>() // (r + c)
        var negDiagSet = Set<Int>() // (r - c)
        var result = [[String]]()
        var board = [[String]](
            repeating: [String](repeating: ".", count: n),
            count: n
        )
        
        backtrack(0)
        return result
    }
    
}
