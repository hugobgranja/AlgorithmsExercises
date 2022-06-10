//
//  WordSearchII.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//
//  |Word Search II|
//  |
//  Given an m x n board of characters and a list of strings words, return all words on the board.
//  Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring.
//  The same letter cell may not be used more than once in a word.
//

import Foundation

class WordSearchII {
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        func adjacentTo(_ row: Int, _ col: Int) -> [(Int, Int)] {
            return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
                .filter {
                    (0..<board.count).contains($0) &&
                    (0..<board[0].count).contains($1)
                }
        }
        
        func dfs(_ row: Int, _ col: Int, _ node: Trie.Node, _ word: String) {
            let coordinate = Coordinate(row: row, col: col)
            guard !used.contains(coordinate) else { return }
            
            let char = board[row][col]
            used.insert(coordinate)
            
            if let nextNode = node.next[char] {
                let matchedWord = word + String(char)
                
                if nextNode.isMember {
                    result.append(matchedWord)
                    trie.remove(matchedWord)
                }
                
                if nextNode.next.count > 0 {
                    for (row, col) in adjacentTo(row, col) {
                        dfs(row, col, nextNode, matchedWord)
                    }
                }
            }
                
            used.remove(coordinate)
        }
        
        let trie = Trie()
        words.forEach { trie.insert($0) }
        
        var result = [String]()
        var used = Set<Coordinate>()
        
        for row in board.indices {
            for col in board[row].indices {
                dfs(row, col, trie.root, "")
            }
        }
        
        return result
    }
    
}
