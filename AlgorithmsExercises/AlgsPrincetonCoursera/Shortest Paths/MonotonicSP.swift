//
//  MonotonicSP.swift
//  Created by hg on 20/03/2022.
//
//  Monotonic shortest path.
//  Given an edge-weighted digraph G, design an E log E algorithm to find a monotonic shortest path from s to every other vertex.
//  A path is monotonic if the sequence of edge weights along the path are either strictly increasing or strictly decreasing.
//
//  Below is an increasing weight only version, decreasing weight should be similar.
//  Run one after the other if it has not found a monotonic path in the first to get both checks.
//

import Foundation
import SwiftAlgorithms

public class MonotonicSP {
    
    private var edgeTo: [DirectedEdge?]
    private var distTo: [Double]
    private var pq: IndexedPriorityQueue<Double>
    
    public init(graph: EdgeWeightedDigraph, source: Int) {
        let count = graph.vertexCount()
        self.edgeTo = [DirectedEdge?](repeating: nil, count: count)
        self.distTo = [Double](repeating: Double.infinity, count: count)
        self.pq = IndexedPriorityQueue(length: count, isLowerPriority: { $0 > $1 })
        monotonicSP(graph: graph, source: source)
    }
    
    private func monotonicSP(graph: EdgeWeightedDigraph, source: Int) {
        distTo[source] = 0
        pq.enqueue(index: source, key: distTo[source])
        
        while let (vertex, _) = pq.dequeue() {
            for edge in graph.adjacentEdges(to: vertex) {
                relaxAscending(edge)
            }
        }
    }
    
    private func relaxAscending(_ edge: DirectedEdge) {
        let source = edge.source
        let dest = edge.destination
        let distance = distTo[source] + edge.weight
        let prevEdgeWeight = edgeTo[edge.source]?.weight ?? distTo[edge.source]
        
        if edge.weight > prevEdgeWeight, distTo[dest] > distance {
            distTo[dest] = distance
            edgeTo[dest] = edge
            pq.enqueue(index: dest, key: distance)
        }
    }
    
    public func distance(to vertex: Int) -> Double {
        return distTo[vertex]
    }
    
    public func hasPath(to vertex: Int) -> Bool {
        return distTo[vertex] < Double.infinity
    }
    
    public func path(to vertex: Int) -> [DirectedEdge]? {
        guard hasPath(to: vertex) else { return nil }
        
        var path = [DirectedEdge]()
        var edge = edgeTo[vertex]
        
        while let someEdge = edge {
            path.append(someEdge)
            edge = edgeTo[someEdge.source]
        }
        
        return path.reversed()
    }
    
    public func hasMonotonicPath() -> Bool {
        return distTo.allSatisfy { $0 < Double.infinity }
    }
    
}
