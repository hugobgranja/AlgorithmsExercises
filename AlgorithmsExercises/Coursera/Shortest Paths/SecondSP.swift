//
//  SecondSP.swift
//  AlgorithmsExercises
//
//  Created by hg on 22/03/2022.
//
//  Second shortest path.
//  Given an edge-weighted digraph and let P be a shortest path from vertex s to vertex t.
//  Design an E log V algorithm to find a path (not necessarily simple) other than P from s to t that is as short as possible.
//  Assume all of the edge weights are strictly positive.
//  Hint: compute the shortest path distances from s to every vertex and the shortest path distances from every vertex to t.
//

import Foundation
import SwiftAlgorithms

class SecondSP {
    
    // The second shortest path must have at least one edge that does not belong to the shortest path.
    // Find the shortest path that contains such an edge and that will be the second shortest path.
    
    func findSP(graph: EdgeWeightedDigraph, from source: Int, to destination: Int) -> [DirectedEdge]? {
        let sp = DijkstraSP(graph: graph, source: source)
        guard let shortestPath = sp.path(to: destination) else { return nil }
        let revSP = DijkstraSP(graph: graph.reversed(), source: destination)
        
        let connectingEdges = graph.getEdges().filter {
            sp.hasPath(to: $0.source) && revSP.hasPath(to: $0.destination)
        }
        
        let possibleEdges = Set(connectingEdges).subtracting(Set(shortestPath))
        
        let minEdge = possibleEdges
            .map {
                ($0, sp.distance(to: $0.source) + revSP.distance(to: $0.destination) + $0.weight)
            }
            .min { $0.1 < $1.1 }
            .map { $0.0 }

        if let minEdge = minEdge {
            let spToEdgeSource = sp.path(to: minEdge.source)!
            let unreversedSP = reverseEdges(revSP.path(to: minEdge.destination)!)
            return spToEdgeSource + [minEdge] + unreversedSP
        }
        
        return nil
    }
    
    private func reverseEdges(_ edges: [DirectedEdge]) -> [DirectedEdge] {
        return edges.reversed().map {
            DirectedEdge(from: $0.destination, to: $0.source, weight: $0.weight)
        }
    }
    
}
