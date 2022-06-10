//
//  SearchMatrix.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Search a 2D Matrix|
//  |Matrix|Binary Search|
//  Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix.
//  This matrix has the following properties:
//  Integers in each row are sorted from left to right.
//  The first integer of each row is greater than the last integer of the previous row.
//

import Foundation

class SearchMatrix {
    
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let colCount = matrix[0].count
        var lowerBound = 0
        var upperBound = matrix.count * colCount - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            let row = mid / colCount
            let col = mid % colCount
            if target < matrix[row][col] { upperBound = mid - 1 }
            else if target > matrix[row][col] { lowerBound = mid + 1 }
            else { return true }
        }
        
        return false
    }
    
}
