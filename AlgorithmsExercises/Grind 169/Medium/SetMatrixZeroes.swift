//
//  SetMatrixZeroes.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Set Matrix Zeroes|
//  |Matrix|Hash Table|
//  Given an m x n integer matrix matrix, if an element is 0, set its entire row and column to 0's.
//  You must do it in place.
//

import Foundation

class SetMatrixZeroes {
    
    // O(m * n) time, O(m + n) space
    func setZeroes(_ matrix: inout [[Int]]) {
        var zeroInRows = Set<Int>()
        var zeroInCols = Set<Int>()
        
        for (rowIndex, row) in matrix.enumerated() {
            for (colIndex, num) in row.enumerated() {
                if num == 0 {
                    zeroInRows.insert(rowIndex)
                    zeroInCols.insert(colIndex)
                }
            }
        }
        
        for (rowIndex, row) in matrix.enumerated() {
            for colIndex in row.indices {
                if zeroInRows.contains(rowIndex) || zeroInCols.contains(colIndex) {
                    matrix[rowIndex][colIndex] = 0
                }
            }
        }
    }
    
    // O(m * n) time
    func setZeroes2(_ matrix: inout [[Int]]) {
        var shouldZeroFirstCol = false
        
        for (rowIndex, row) in matrix.enumerated() {
            for (colIndex, num) in row.enumerated() {
                if num == 0 {
                    matrix[rowIndex][0] = 0
                    if colIndex == 0 { shouldZeroFirstCol = true }
                    else { matrix[0][colIndex] = 0 }
                }
            }
        }
        
        for (rowIndex, row) in matrix.enumerated().reversed() {
            for colIndex in row.indices.reversed() {
                if matrix[rowIndex][0] == 0 || (colIndex == 0 && shouldZeroFirstCol) || (colIndex != 0 && matrix[0][colIndex] == 0) {
                    matrix[rowIndex][colIndex] = 0
                }
            }
        }
    }
    
}
