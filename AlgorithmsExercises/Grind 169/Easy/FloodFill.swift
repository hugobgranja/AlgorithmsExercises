//
//  FloodFill.swift
//  AlgorithmsExercises
//  Created by hg on 25/05/2022.
//
//  |Flood Fill|
//  |Matrix|DFS|BFS|
//  An image is represented by an m x n integer grid image where image[i][j] represents the pixel value of the image.
//  You are also given three integers sr, sc, and newColor.
//  You should perform a flood fill on the image starting from the pixel image[sr][sc].
//  To perform a flood fill, consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color), and so on.
//  Replace the color of all of the aforementioned pixels with newColor.
//  Return the modified image after performing the flood fill.
//

import Foundation

class FloodFill {
    
    func solve(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        guard image[sr][sc] != newColor else { return image }
        
        let oldColor = image[sr][sc]
        var image = image
        var stack: [(Int, Int)] = [(sr, sc)]
        
        while let (row, col) = stack.popLast() {
            image[row][col] = newColor
            
            let neighbors = neighbors(of: (row, col), in: image)
                .filter { sr, sc in image[sr][sc] == oldColor }
            
            stack.append(contentsOf: neighbors)
        }
        
        return image
    }
    
    private func neighbors(of pixel: (Int, Int), in image: [[Int]]) -> [(Int, Int)] {
        let (row, col) = pixel
        return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
            .filter { row, col in
                row >= 0 && row < image.count &&
                col >= 0 && col < image[0].count
            }
    }
    
    
    // Recursive solution
    func floodFillRec(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        let oldColor = image[sr][sc]
        guard oldColor != newColor else { return image }
        var image = image
        fillRec(&image, sr, sc, newColor, oldColor)
        return image
    }
           
    func fillRec(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int, _ oldColor: Int) {
        if sr < 0 || sr >= image.count  { return }
        if sc < 0 || sc >= image[0].count { return }
        if image[sr][sc] != oldColor { return }
        
        image[sr][sc] = newColor
        fillRec(&image, sr + 1, sc, newColor, oldColor)
        fillRec(&image, sr - 1, sc, newColor, oldColor)
        fillRec(&image, sr, sc + 1, newColor, oldColor)
        fillRec(&image, sr, sc - 1, newColor, oldColor)
    }
    
}
