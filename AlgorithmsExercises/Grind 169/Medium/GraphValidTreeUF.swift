//
//  GraphValidTreeUF.swift
//  AlgorithmsExercises
//  Created by hg on 12/06/2022.
//
//  |Graph Valid Tree|
//  |Graph|Union Find|
//  Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.
//  Edges make up a valid tree if every node except root have one and only one parent and the root node can rech every node.
//

import Foundation

class GraphValidTreeUF {
    
    // Graph is valid tree if is connected and has n - 1 edges.
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        guard n > 0 && edges.count == n - 1 else { return false }
        
        let uf = UF(size: n)
        
        for edge in edges {
            uf.union(edge[0], edge[1])
        }
        
        return uf.count == 1
    }
    
    private class UF {
        private var parent: [Int]
        private var rank: [UInt8]
        private(set) var count: Int
        
        init(size: Int) {
            parent = [Int]()
            rank = [UInt8]()
            
            for i in 0..<size {
                parent.append(i)
                rank.append(0)
            }
            
            count = size
        }
        
        func union(_ p: Int, _ q: Int) {
            let i = find(p)
            let j = find(q)
            
            if i == j { return }
            
            if rank[i] < rank[j] {
                parent[i] = j
            }
            else if rank[i] > rank[j] {
                parent[j] = parent[i]
            }
            else {
                parent[j] = i
                rank[i] += 1
            }
            
            count -= 1
        }
        
        func find(_ p: Int) -> Int {
            var i = p
            
            while i != parent[i] {
                parent[i] = parent[parent[i]]
                i = parent[i]
            }
            
            return i
        }
    }
    
}
