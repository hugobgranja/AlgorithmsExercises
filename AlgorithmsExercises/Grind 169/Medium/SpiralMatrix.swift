//
//  SpiralMatrix.swift
//  AlgorithmsExercises
//  Created by hg on 05/06/2022.
//
//  |Spiral Matrix|
//  |Matrix|
//  Given an m x n matrix, return all elements of the matrix in spiral order.
//

import Foundation

class SpiralMatrix {
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = matrix.count - 1
        
        while left <= right && top <= bottom {
            for index in left...right {
                result.append(matrix[top][index])
            }
            top += 1
            if top > bottom { break }
            
            for index in top...bottom {
                result.append(matrix[index][right])
            }
            right -= 1
            if left > right { break }
            
            for index in (left...right).reversed() {
                result.append(matrix[bottom][index])
            }
            bottom -= 1
            if top > bottom { break }
            
            for index in (top...bottom).reversed() {
                result.append(matrix[index][left])
            }
            left += 1
        }
        
        return result
    }
    
}
