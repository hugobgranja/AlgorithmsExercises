//
//  SkippableEdgeSP.swift
//  AlgorithmsExercises
//  Created by hg on 23/03/2022.
//
//  Shortest path with one skippable edge.
//  Given an edge-weighted digraph, design an E log V algorithm to find a shortest path from s to t where you can change the weight of any one edge to zero.
//  Assume the edge weights are nonnegative.
//  Hint: compute the shortest path from s to every vertex; compute the shortest path from every vertex to t; combine.
//

import Foundation
import SwiftAlgorithms

class SkippableEdgeSP {

    func findSP(graph: EdgeWeightedDigraph, from source: Int, to destination: Int) -> [DirectedEdge]? {
        let sp = DijkstraSP(graph: graph, source: source)
        guard sp.hasPath(to: destination) else { return nil }
        let revSP = DijkstraSP(graph: graph.reversed(), source: destination)
        
        let skippableEdge = graph.getEdges()
            // Filter for edges connecting source to destination.
            .filter {
                sp.hasPath(to: $0.source) && revSP.hasPath(to: $0.destination)
            }
            // Calculate distances for those edges without adding the weight of the possible skippable edge.
            .map {
                ($0, sp.distance(to: $0.source) + revSP.distance(to: $0.destination))
            }
            // Find the minimum distance of connecting paths where one edge was skipped.
            .min { $0.1 < $1.1 }
            .map { $0.0 }

        // Build shortest path that goes through the skipped edge.
        if let skippableEdge = skippableEdge {
            let spToEdgeSource = sp.path(to: skippableEdge.source)!
            let unreversedSP = reverseEdges(revSP.path(to: skippableEdge.destination)!)
            return spToEdgeSource + [skippableEdge] + unreversedSP
        }
        
        return nil
    }
    
    private func reverseEdges(_ edges: [DirectedEdge]) -> [DirectedEdge] {
        return edges.reversed().map {
            DirectedEdge(from: $0.destination, to: $0.source, weight: $0.weight)
        }
    }

}
