//
//  SwapLexOrder.swift
//  AlgorithmsExercises
//
//  Created by hg on 04/05/2022.
//
//  Given a string str and array of pairs that indicates which indices in the string can be swapped, return the lexicographically largest string that results from doing the allowed swaps.
//  You can swap indices any number of times.
//
//  Example
//  For str = "abdc" and pairs = [[1, 4], [3, 4]], the output should be
//  solution(str, pairs) = "dbca".
//  By swapping the given indices, you get the strings: "cbda", "cbad", "dbac", "dbca". The lexicographically largest string in this list is "dbca".
//

import Foundation
import SwiftAlgorithms

class SwapLexOrder {
    
    func solve(str: String, pairs: [[Int]]) -> String {
        let disjointPairs = createDisjointPairs(str: str, pairs: pairs)
        let originalChars = Array(str)
        var modifiedChars = Array(str)
        
        for indices in disjointPairs {
            let sorted = indices.sorted { modifiedChars[$0] > modifiedChars[$1] }
            
            for (index, largest) in zip(indices, sorted) {
                modifiedChars[index] = originalChars[largest]
            }
        }
        
        return String(modifiedChars)
    }
    
    // Use a proper Union-Find implementation for better complexity.
    private func createDisjointPairs(str: String, pairs: [[Int]]) -> [[Int]] {
        var ids = [Int](0..<str.count)
         
        for pair in pairs {
            let pid = ids[pair[0] - 1]
            let qid = ids[pair[1] - 1]
            
            if pid != qid {
                for (index, id) in ids.enumerated() {
                    if id == pid { ids[index] = qid }
                }
            }
        }
        
        return ids
            .enumerated()
            .reduce(into: [Int: [Int]]()) { $0[$1.element, default: []].append($1.offset) }
            .values
            .filter { $0.count > 1 }
    }
    
}
