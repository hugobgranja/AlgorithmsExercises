//
//  ZeroOneMatrix.swift
//  AlgorithmsExercises
//  Created by hg on 30/05/2022.
//
//  |01 Matrix|
//  |Matrix|Dynamic Programming|BFS|
//  Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
//  The distance between two adjacent cells is 1.
//
//  Other topics: BFS
//

import Foundation

class ZeroOneMatrix {
    
    // O(row * col) time, O(row * col) space - BFS starting from zeroes
    func solve(_ mat: [[Int]]) -> [[Int]] {
        var distances = mat.map { $0.map { _ in Int.max }}
        var queue = [(Int, Int)]()
        
        for (rowIndex, row) in mat.enumerated() {
            for (colIndex, elem) in row.enumerated() {
                if elem == 0 {
                    distances[rowIndex][colIndex] = 0
                    queue.append((rowIndex, colIndex))
                }
            }
        }
        
        while let (row, col) = queue.first {
            queue.removeFirst()
            
            for (nRow, nCol) in neighbors(mat, row, col) {
                let newDistance = distances[row][col] + 1
                
                if newDistance < distances[nRow][nCol] {
                    distances[nRow][nCol] = newDistance
                    queue.append((nRow, nCol))
                }
            }
        }
        
        return distances
    }
    
    private func neighbors(_ array: [[Int]], _ row: Int, _ col: Int) -> [(Int, Int)] {
        let candidates = [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
        var neighbors = [(Int, Int)]()
        
        for (row, col) in candidates {
            if row >= 0 && row < array.count && col >= 0 && col < array[row].count {
                neighbors.append((row, col))
            }
        }
        
        return neighbors
    }
    
    // O(row * col) time - DP top left + bottom right
    func solve2(_ mat: [[Int]]) -> [[Int]] {
        var distances = mat.map { $0.map { _ in Int.max - 100000 }}
        
        for (row, array) in mat.enumerated() {
            for (col, elem) in array.enumerated() {
                if elem == 0 {
                    distances[row][col] = 0
                }
                else {
                    if row > 0 {
                        distances[row][col] = min(distances[row][col], distances[row - 1][col] + 1)
                    }
                    if col > 0 {
                        distances[row][col] = min(distances[row][col], distances[row][col - 1] + 1)
                    }
                }
            }
        }
        
        for (row, array) in mat.enumerated().reversed() {
            for (col, elem) in array.enumerated().reversed() {
                if elem == 0 {
                    distances[row][col] = 0
                }
                else {
                    if row < mat.count - 1 {
                        distances[row][col] = min(distances[row][col], distances[row + 1][col] + 1)
                    }
                    if col < array.count - 1 {
                        distances[row][col] = min(distances[row][col], distances[row][col + 1] + 1)
                    }
                }
            }
        }
        
        return distances
    }
    
}
