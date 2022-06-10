//
//  ReachableVertex.swift
//  AlgorithmsExercises
//  Created by hg on 12/03/2022.
//
//  Reachable vertex.
//  DAG: Design a linear-time algorithm to determine whether a DAG has a vertex that is reachable from every other vertex, and if so, find one.
//  Digraph: Design a linear-time algorithm to determine whether a digraph has a vertex that is reachable from every other vertex, and if so, find one.
//

import Foundation
import SwiftAlgorithms

class ReachableVertex {
    
    // A DAG has a vertex that is reachable from every other vertex iff there is one single vertex with 0 outdegree.
    func findReachableVertexInDAG(graph: Digraph) -> Int? {
        var zeroOutdegreeCount = 0
        var zeroOutdegreeVertex = 0
        
        for v in 0..<graph.vertexCount() {
            if graph.outdegree(of: v) == 0 {
                zeroOutdegreeCount += 1
                zeroOutdegreeVertex = v
            }
        }
        
        return zeroOutdegreeCount == 1 ? zeroOutdegreeVertex : nil
    }
    
    func findReachableVertex(graph: Digraph) -> Int? {
        let scc = KosarajuSharirSCC(graph: graph)
        let kernel = kernelDAG(graph: graph, scc: scc)
        guard let component = findReachableVertexInDAG(graph: kernel) else { return nil }
        return (0..<graph.vertexCount()).lazy.first { scc.id(vertex: $0) == component }
    }
    
    private func kernelDAG(graph: Digraph, scc: SCC) -> Digraph {
        let kernel = Digraph(vertices: scc.count())
        
        for v in 0..<graph.vertexCount() {
            for w in graph.adjacent(to: v) {
                let vId = scc.id(vertex: v)
                let wId = scc.id(vertex: w)
                
                if
                    !scc.isStronglyConnected(v: v, w: w) &&
                    !kernel.adjacent(to: vId).contains(wId)
                {
                    kernel.addEdge(v: vId, w: wId)
                }
            }
        }
        
        return kernel
    }
    
}
