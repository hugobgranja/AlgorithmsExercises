//
//  ShortestDirectedCycle.swift
//  AlgorithmsExercises
//  Created by hg on 11/03/2022.
//
//  Shortest directed cycle.
//  Given a digraph G, design an efficient algorithm to find a directed cycle with the minimum number of edges (or report that the graph is acyclic).
//  The running time of your algorithm should be at most proportional to V(E + V) and use space proportional to E + V, where V is the number of vertices and E is the number of edges.
//

import Foundation
import SwiftAlgorithms

class ShortestDirectedCycle {
    
    func findShortestCycle(graph: Digraph) -> [Int]? {
        let reversed = graph.reversed()
        var length = graph.vertexCount() + 1
        var cycle: [Int]?
        
        for v in 0..<graph.vertexCount() {
            let bfs = BreadthFirstPaths(graph: reversed, source: v)
            
            for w in graph.adjacent(to: v) {
                if let distance = bfs.distance(to: w), distance + 1 < length {
                    length = distance + 1
                    cycle = bfs.path(to: w)
                    cycle?.append(v)
                }
            }
        }
        
        return cycle?.reversed()
    }
    
}
