//
//  WordBoggle.swift
//  AlgorithmsExercises
//  Created by hg on 19/05/2022.
//
//  Boggle is a popular word game in which players attempt to find words in sequences of adjacent letters on a rectangular board.
//  Given a two-dimensional array board that represents the character cells of the Boggle board and an array of unique strings words, find all the possible words from words that can be formed on the board.
//  Note that in Boggle when you're finding a word, you can move from a cell to any of its 8 neighbors, but you can't use the same cell twice in one word.
//

import Foundation

class WordBoggle {
    
    func solve(board: [[Character]], words: [String]) -> [String] {
        let trie = Trie()
        words.forEach { trie.insert($0) }
        
        var result = Set<String>()
        
        for row in board.indices {
            for col in board[row].indices {
                result = result.union(
                    solve(board: board, prev: nil, now: (row, col), node: trie.root, word: "")
                )
            }
        }
        
        return result.sorted()
    }
    
    private func solve(board: [[Character]], prev: (Int, Int)?, now: (Int, Int), node: Trie.Node, word: String) -> [String] {
        let char = board[now.0][now.1]
        var result = [String]()
        
        if let nextNode = node.next[char] {
            let matchedWord = word + String(char)
            
            if nextNode.isMember {
                result.append(matchedWord)
            }
            
            for (row, col) in neighbors(of: now, except: prev, in: board) {
                result += solve(board: board, prev: now, now: (row, col), node: nextNode, word: matchedWord)
            }
        }
        
        return result
    }
    
    private func neighbors(of i: (Int, Int), except ex: (Int, Int)?, in board: [[Character]]) -> [(Int, Int)] {
        let (x, y) = i
        
        return [
            (x - 1, y - 1), (x, y - 1), (x + 1, y - 1),
            (x - 1, y),                 (x + 1, y),
            (x - 1, y + 1), (x, y + 1), (x + 1, y + 1)
        ]
            .filter { x, y in
                x >= 0 && x < board.count &&
                y >= 0 && y < board[0].count &&
                !(x == ex?.0 && y == ex?.1)
            }
    }
    
}
