//
//  WordSearch.swift
//  AlgorithmsExercises
//  Created by hg on 08/06/2022.
//
//  |Word Search|
//  |Matrix|Backtracking|
//  Given an m x n grid of characters board and a string word, return true if word exists in the grid.
//  The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring.
//  The same letter cell may not be used more than once.
//

import Foundation

class WordSearch {
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        func adjacent(to coordinate: Coordinate) -> [Coordinate] {
            let (row, col) = (coordinate.row, coordinate.col)
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<board.count).contains($0) &&
                    (0..<board[0].count).contains($1)
                }
                .map { Coordinate(row: $0, col: $1) }
        }
        
        func dfs<T: StringProtocol>(_ word: T, _ coordinate: Coordinate) -> Bool {
            guard let char = word.first else { return true }
            guard char == board[coordinate.row][coordinate.col] else { return false }
            used.insert(coordinate)
            
            for neighbor in adjacent(to: coordinate) {
                if !used.contains(neighbor) && dfs(word.dropFirst(), neighbor) {
                    return true
                }
            }
            
            used.remove(coordinate)
            return word.count == 1
        }
        
        var used = Set<Coordinate>()
        
        for (rowIndex, row) in board.enumerated() {
            for colIndex in row.indices {
                let coordinate = Coordinate(row: rowIndex, col: colIndex)
                if dfs(word, coordinate) { return true }
            }
        }
        
        return false
    }
    
}
