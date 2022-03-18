//
//  DAGHamiltonianPath.swift
//  AlgorithmsExercises
//
//  Created by hg on 12/03/2022.
//
//  Hamiltonian path in a DAG.
//  Given a directed acyclic graph, design a linear-time algorithm to determine whether it has a Hamiltonian path (a simple path that visits every vertex), and if so, find one.
//

import Foundation
import SwiftAlgorithms

class DAGHamiltonianPath {
    
    func findHamiltonianPath(graph: Digraph) -> [Int]? {
        guard let order = TopologicalOrder().getOrder(graph: graph) else { return nil }
        
        if order.count < 2 { return order }
        
        for index in 0..<order.count - 1 {
            let v = order[index]
            let w = order[index + 1]
            if !graph.adjacent(to: v).contains(w) { return nil }
        }
        
        return order
    }
    
}
