//
//  GraphValidTree.swift
//  AlgorithmsExercises
//  Created by hg on 12/06/2022.
//
//  |Graph Valid Tree|
//  |Graph|DFS|BFS|
//  Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
//  Edges make up a valid tree if every node except root have one and only one parent and the root node can rech every node.
//

import Foundation

class GraphValidTree {
    
    // Graph is valid tree if is connected and has n - 1 edges.
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard n > 0 && edges.count == n - 1 else { return false }
        
        var adjacencyList = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            adjacencyList[edge[0]].append(edge[1])
            adjacencyList[edge[1]].append(edge[0])
        }
        
        return isValidTreeDFS(adjacencyList)
    }
    
    private func isValidTreeDFS(_ adjacencyList: [[Int]]) -> Bool {
        func dfs(_ v: Int) {
            visited.insert(v)
            
            for w in adjacencyList[v] where !visited.contains(w) {
                dfs(w)
            }
        }
        
        var visited = Set<Int>()
        dfs(0)
        
        return visited.count == adjacencyList.count
    }
    
}
