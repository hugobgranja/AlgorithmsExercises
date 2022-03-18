//
//  MinWeightFeedbackEdgeSet.swift
//  AlgorithmsExercises
//
//  Created by hg on 18/03/2022.
//
//  Minimum-weight feedback edge set.
//  A feedback edge set of a graph is a subset of edges that contains at least one edge from every cycle in the graph.
//  If the edges of a feedback edge set are removed, the resulting graph is acyclic.
//  Given an edge-weighted graph, design an efficient algorithm to find a feedback edge set of minimum weight.
//  Assume the edge weights are positive.
//

import Foundation
import SwiftAlgorithms

class MinWeightFeedbackEdgeSet {

    // Finds edges that don't belong in a maximum spanning tree.
    // Uses modified Kruskal's Algorithm.
    func minWeightFeedbackEdgeSet(graph: EdgeWeightedGraph) -> [WeightedEdge] {
        let sortedEdges = graph.getEdges().sorted(by: >)
        let uf = WeightedQuickUnionUF(length: graph.vertexCount())
        var fes = [WeightedEdge]()
        
        for edge in sortedEdges {
            if !uf.connected(edge.v, edge.w) {
                uf.union(edge.v, edge.w)
            }
            else {
                fes.append(edge)
            }
        }
        
        return fes
    }
    
}
