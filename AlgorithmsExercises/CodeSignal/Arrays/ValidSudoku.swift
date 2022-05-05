//
//  ValidSudoku.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/04/2022.
//
//  Sudoku is a number-placement puzzle.
//  The objective is to fill a 9 × 9 grid with numbers in such a way that each column, each row, and each of the nine 3 × 3 sub-grids that compose the grid all contain all of the numbers from 1 to 9 one time.
//  Implement an algorithm that will check whether the given grid of numbers represents a valid Sudoku puzzle according to the layout rules described above.
//  Note that the puzzle represented by grid does not have to be solvable.
//

import Foundation

class ValidSudoku {
    
    func solve(_ grid: [[Character]]) -> Bool {
        var seen = Set<String>()
        
        for (rowIndex, row) in grid.enumerated() {
            for (colIndex, number) in row.enumerated() where number != "." {
                let rowId = "r\(rowIndex)\(number)"
                let colId = "c\(colIndex)\(number)"
                let subgrid = ((rowIndex / 3) * 3) + (colIndex / 3)
                let subgridId = "s\(subgrid)\(number)"
                
                if seen.contains(rowId) || seen.contains(colId) || seen.contains(subgridId) {
                    return false
                }
                else {
                    seen.insert(rowId)
                    seen.insert(colId)
                    seen.insert(subgridId)
                }
            }
        }
        
        return true
    }
    
}
