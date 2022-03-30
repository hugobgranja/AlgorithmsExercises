//
//  FattestPath.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/03/2022.
//
//  Fattest path.
//  Given an edge-weighted digraph and two vertices s and t, design an E log E algorithm to find a fattest path from s to t.
//  The bottleneck capacity of a path is the minimum weight of an edge on the path.
//  A fattest path is a path such that no other path has a higher bottleneck capacity.
//

import Foundation
import SwiftAlgorithms

class FattestPath {
    
    private var edgeTo: [DirectedEdge?]
    private var bottleneckTo: [Double]
    private var pq: IndexedPriorityQueue<Double>
    private var destination: Int
    
    public init(graph: EdgeWeightedDigraph, source: Int, destination: Int) {
        let count = graph.vertexCount()
        self.edgeTo = [DirectedEdge?](repeating: nil, count: count)
        self.bottleneckTo = [Double](repeating: 0, count: count)
        self.pq = IndexedPriorityQueue(length: count, isLowerPriority: { $0 < $1 })
        self.destination = destination
        dijkstra(graph: graph, source: source, destination: destination)
    }
    
    private func dijkstra(graph: EdgeWeightedDigraph, source: Int, destination: Int) {
        bottleneckTo[source] = Double.infinity
        pq.enqueue(index: source, key: bottleneckTo[source])
        
        while let (v, _) = pq.dequeue() {
            guard v != destination else { continue }
            
            for edge in graph.adjacentEdges(to: v) {
                relax(edge)
            }
        }
    }
    
    private func relax(_ edge: DirectedEdge) {
        let source = edge.source
        let dest = edge.destination
        let bottleneck = min(bottleneckTo[source], edge.weight)
        
        if bottleneckTo[dest] < bottleneck {
            bottleneckTo[dest] = bottleneck
            edgeTo[dest] = edge
            
            if pq.contains(index: dest) {
                pq.increaseKey(index: dest, key: bottleneck)
            }
            else {
                pq.enqueue(index: dest, key: bottleneck)
            }
        }
    }
    
    public func path() -> [DirectedEdge]? {
        var path = [DirectedEdge]()
        var edge = edgeTo[destination]
        
        while let someEdge = edge {
            path.append(someEdge)
            edge = edgeTo[someEdge.source]
        }
        
        return path.isEmpty ? nil : path.reversed()
    }
    
}
