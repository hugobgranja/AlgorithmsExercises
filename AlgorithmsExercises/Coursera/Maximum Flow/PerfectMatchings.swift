//
//  PerfectMatchings.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/03/2022.
//
//  Perfect matchings in k-regular bipartite graphs.
//  Suppose that there are n men and n women at a dance and that each man knows exactly k women and each woman knows exactly k men (and relationships are mutual).
//  Show that it is always possible to arrange a dance so that each man and woman are matched with someone they know.
//

import Foundation
import SwiftAlgorithms

class PerfectMatchings {
    
    func maxFlow(n: Int, k: Int) -> Decimal? {
        guard n > 0 && k > 0 && k <= n else { return nil }
        let flowNetwork = createFlowNetwork(n: n, k: k)
        let sink = flowNetwork.vertexCount() - 1
        let fordFulkerson = FordFulkerson(flowNetwork: flowNetwork, source: 0, sink: sink)
        return fordFulkerson.maxFlow()
    }
    
    private func createFlowNetwork(n: Int, k: Int) -> FlowNetwork {
        let vertexCount = 2 + 2 * n
        let sink = vertexCount - 1
        let flowNetwork = FlowNetwork(vertices: vertexCount)
        let edgeCapacity = 1 / Decimal(k)
        
        for vertex in 1...n {
            flowNetwork.addEdge(FlowEdge(from: 0, to: vertex, capacity: 1))
            flowNetwork.addEdge(FlowEdge(from: vertex + n, to: sink, capacity: 1))
        }
        
        for man in 1...n {
            for woman in n+1...n*2 {
                flowNetwork.addEdge(FlowEdge(from: man, to: woman, capacity: edgeCapacity))
            }
        }
        
        return flowNetwork
    }
    
}
