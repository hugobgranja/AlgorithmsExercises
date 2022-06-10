//
//  MinimumHeightTrees.swift
//  AlgorithmsExercises
//  Created by hg on 08/06/2022.
//
//  |Minimum Height Trees|
//  |Graph|Topological Sort|
//  A tree is an undirected graph in which any two vertices are connected by exactly one path.
//  In other words, any connected graph without simple cycles is a tree.
//  Given a tree of n nodes labelled from 0 to n - 1, and an array of n - 1 edges where edges[i] = [ai, bi] indicates that there is an undirected edge between the two nodes ai and bi in the tree, you can choose any node of the tree as the root.
//  When you select a node x as the root, the result tree has height h. Among all possible rooted trees, those with minimum height (i.e. min(h))  are called minimum height trees (MHTs).
//  Return a list of all MHTs' root labels. You can return the answer in any order.
//  The height of a rooted tree is the number of edges on the longest downward path between the root and a leaf.
//

import Foundation

class MinimumHeightTrees {
    
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        if n < 2 { return [Int](0..<n) }
        
        var adjacencyList = [Set<Int>](repeating: [], count: n)
        
        for edge in edges {
            adjacencyList[edge[0]].insert(edge[1])
            adjacencyList[edge[1]].insert(edge[0])
        }
        
        var leaves = (0..<n).filter { adjacencyList[$0].count == 1 }
        var remainingNodes = n
        
        while remainingNodes > 2 {
            var newLeaves = [Int]()
            
            for leaf in leaves {
                let adjacent = adjacencyList[leaf].first!
                adjacencyList[adjacent].remove(leaf)
                
                if adjacencyList[adjacent].count == 1 {
                    newLeaves.append(adjacent)
                }
            }
            
            remainingNodes -= leaves.count
            leaves = newLeaves
        }
        
        return leaves
    }
    
}
