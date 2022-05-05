//
//  NQueens.swift
//  AlgorithmsExercises
//
//  Created by hg on 18/05/2022.
//
//  In chess, queens can move any number of squares vertically, horizontally, or diagonally.
//  The n-queens puzzle is the problem of placing n queens on an n × n chessboard so that no two queens can attack each other.
//  Given an integer n, print all possible distinct solutions to the n-queens puzzle.
//  Each solution contains distinct board configurations of the placement of the n queens, where the solutions are arrays that contain permutations of [1, 2, 3, .. n].
//  The number in the ith position of the results array indicates that the ith column queen is placed in the row with that number.
//  In your solution, the board configurations should be returned in lexicographical order.
//

import Foundation

class NQueens {
    
    func solve(n: Int) -> [[Int]] {
        return solve(n: n, board: [])
    }
    
    private func solve(n: Int, board: [Int]) -> [[Int]] {
        guard board.count < n else { return [board] }
        
        var result = [[Int]]()
        
        for col in 1...n {
            if !isAttackable(newRow: board.count + 1, newCol: col, board: board) {
                result += solve(n: n, board: board + [col])
            }
        }
        
        return result
    }
    
    private func isAttackable(newRow: Int, newCol: Int, board: [Int]) -> Bool {
        for (row, col) in board.enumerated() {
            if newCol == col || abs(newCol - col) == abs(newRow - (row + 1)) {
                return true
            }
        }

        return false
    }
    
}
