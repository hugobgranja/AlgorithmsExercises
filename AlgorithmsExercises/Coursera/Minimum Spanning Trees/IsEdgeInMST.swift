//
//  IsEdgeInMST.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/03/2022.
//
//  Is an edge in a MST.
//  Given an edge-weighted graph G and an edge e, design a linear-time algorithm to determine whether e appears in some MST of G.
//
//  MST cycle property:
//  "For any cycle C in the graph, if the weight of an edge E of C is larger than the weights of all other edges of C, then this edge cannot belong to an MST."
//

import Foundation
import SwiftAlgorithms

class IsEdgeInMST {
    
    // For edge u-v, try to reach v from u using dfs traversing smaller weighted edges only.
    // If reachable, u-v belongs to a cycle with a smaller weighted edge and by the cycle property u-v does not belong to the MST.
    // If not, u-v either does not belong to a cycle or it is the smallest weighted edge in every cycle it belongs to so it belongs to the MST.
    func isEdgeInMST(graph: EdgeWeightedGraph, edge: WeightedEdge) -> Bool {
        var marked = [Bool](repeating: false, count: graph.vertexCount())
        let stack = ArrayStack<Int>([edge.v])
        
        while let vertex = stack.pop() {
            marked[vertex] = true
            
            for someEdge in graph.adjacentEdges(to: vertex) where someEdge.weight < edge.weight {
                if let other = someEdge.other(vertex: vertex), !marked[other] {
                    stack.push(other)
                }
            }
        }
        
        return !marked[edge.w]
    }
    
}
