//
//  RotateImageLT.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Rotate Image|
//  |Matrix|Math|
//  You are given an n x n 2D matrix representing an image, rotate the image in-place by 90 degrees (clockwise).
//

import Foundation

class RotateImageLT {
    
    func rotate(_ matrix: inout [[Int]]) {
        var left = 0
        var right = matrix.count - 1
        
        while left < right {
            let colCount = right - left
            
            for i in 0..<colCount{
                let top = left
                let bottom = right
                let topLeft = matrix[top][left + i]
                matrix[top][left + i] = matrix[bottom - i][left]
                matrix[bottom - i][left] = matrix[bottom][right - i]
                matrix[bottom][right - i] = matrix[top + i][right]
                matrix[top + i][right] = topLeft
            }
            
            right -= 1
            left += 1
        }
    }
    
    func rotate2(_ matrix: inout [[Int]]) {
        matrix.reverse()

        for i in 0..<matrix.count {
            for j in (i+1)..<matrix.count {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
}
