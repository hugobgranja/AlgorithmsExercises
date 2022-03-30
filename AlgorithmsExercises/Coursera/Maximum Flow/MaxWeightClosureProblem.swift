//
//  MaxWeightClosureProblem.swift
//  AlgorithmsExercises
//
//  Created by hg on 30/03/2022.
//
//  Maximum weight closure problem.
//  A subset of vertices S in a digraph is closed if there are no edges pointing from S to a vertex outside S.
//  Given a digraph with weights (positive or negative) on the vertices, find a closed subset of vertices of maximum total weight.
//  https://en.wikipedia.org/wiki/Closure_problem
//

import Foundation
import SwiftAlgorithms

class MaxWeightClosureProblem {
    
    func findClosure(vertices: [WeightedVertex]) -> [WeightedVertex] {
        let flowNetwork = createFlowNetwork(vertices: vertices)
        let source = flowNetwork.vertexCount() - 2
        let sink = flowNetwork.vertexCount() - 1
        let fordFulkerson = FordFulkerson(flowNetwork: flowNetwork, source: source, sink: sink)
        
        var closure = [WeightedVertex]()
        
        for vertex in vertices {
            if fordFulkerson.isInCut(vertex: vertex.id) {
                closure.append(vertex)
            }
        }
        
        return closure
    }
    
    private func createFlowNetwork(vertices: [WeightedVertex]) -> FlowNetwork {
        let vertexCount = 2 + vertices.count
        let source = vertexCount - 2
        let sink = vertexCount - 1
        let flowNetwork = FlowNetwork(vertices: vertexCount)
        
        for vertex in vertices {
            if vertex.weight >= 0 {
                flowNetwork.addEdge(FlowEdge(from: source, to: vertex.id, capacity: vertex.weight))
            }
            else {
                flowNetwork.addEdge(FlowEdge(from: vertex.id, to: sink, capacity: -vertex.weight))
            }
            
            for adjVertex in vertex.adjacent {
                flowNetwork.addEdge(
                    FlowEdge(from: vertex.id, to: adjVertex.id, capacity: Decimal.greatestFiniteMagnitude)
                )
            }
        }
        
        return flowNetwork
    }
    
}
