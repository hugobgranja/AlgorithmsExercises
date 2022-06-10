//
//  AlienDictionary.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//
//  |Alien Dictionary|
//  |Graph|DFS|Topological Sort|
//  There is a new alien language which uses the latin alphabet.
//  However, the order among letters are unknown to you.
//  You receive a list of non-empty words from the dictionary, where words are sorted lexicographically by the rules of this new language.
//  Derive the order of letters in this language.
//

import Foundation

class AlienDictionary {
    
    func alienOrder(_ words: [String]) -> String {
        guard let adjList = buildAdjacencyList(words) else { return "" }
        return findTopologicalOrder(adjList) ?? ""
    }
    
    private func buildAdjacencyList(_ words: [String]) -> [Character: [Character]]? {
        var adjList = [Character: [Character]]()
        
        for word in words {
            for char in word {
                if adjList[char] == nil { adjList[char] = [] }
            }
        }
        
        for (w1, w2) in zip(words, words.dropFirst()) {
            let minCount = min(w1.count, w2.count)
            if w1.count > w2.count && w1.prefix(minCount) == w2.prefix(minCount) {
                return nil
            }
            
            for (c1, c2) in zip(w1, w2).prefix(minCount) {
                if c1 != c2 {
                    adjList[c1]!.append(c2)
                    break
                }
            }
        }
        
        return adjList
    }
    
    private func findTopologicalOrder(_ adjacencyList: [Character: [Character]]) -> String? {
        func dfs(_ c: Character) {
            visiting.insert(c)
            visited.insert(c)
            
            for w in adjacencyList[c]! {
                guard !hasCycle else { return }
                if !visited.contains(w) { dfs(w) }
                else if visiting.contains(w) { hasCycle = true }
            }
            
            visiting.remove(c)
            order.append(c)
        }
        
        var visited = Set<Character>()
        var visiting = Set<Character>()
        var order = ""
        var hasCycle = false
        
        for char in adjacencyList.keys {
            guard !hasCycle else { return nil }
            if !visited.contains(char) { dfs(char) }
        }
        
        return String(order.reversed())
    }
    
}
