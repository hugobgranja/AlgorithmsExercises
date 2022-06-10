//
//  GraphDistances.swift
//  AlgorithmsExercises
//  Created by hg on 18/05/2022.
//
//  You have a strongly connected directed graph that has positive weights in the adjacency matrix g.
//  The graph is represented as a square matrix, where g[i][j] is the weight of the edge (i, j), or -1 if there is no such edge.
//  Given g and the index of a start vertex s, find the minimal distances between the start vertex s and each of the vertices of the graph.
//

import Foundation

class GraphDistances {
    
    func solve(g: [[Int]], s: Int) -> [Int] {
        var distTo = [Int](repeating: Int.max, count: g.count)
        var queue = Set<Int>(0..<g.count)
        distTo[s] = 0
        
        while let u = queue.min(by: { distTo[$0] < distTo[$1] }) {
            queue.remove(u)
            
            for (v, weight) in g[u].enumerated() where queue.contains(v) && weight >= 0 {
                let distance = distTo[u] + weight
                
                if distance < distTo[v] {
                    distTo[v] = distance
                }
            }
        }
        
        return distTo
    }
    
}
