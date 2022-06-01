//
//  CloneGraph.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//
//  Given a reference of a node in a connected undirected graph.
//  Return a deep copy (clone) of the graph.
//

import Foundation
import SwiftAlgorithms

class CloneGraph {
    
    func solveBFS(_ node: GraphNode?) -> GraphNode? {
        guard let root = node else { return nil }
        var graph = [Int: GraphNode]()
        let queue = TwoStackQueue<GraphNode>()
        queue.enqueue(root)
        
        while let node = queue.dequeue() {
            guard graph[node.val] == nil else { continue }
            
            let newNode = GraphNode(node.val)
            graph[node.val] = newNode
            
            for neighbor in node.neighbors where neighbor != nil {
                if let neighborNode = graph[neighbor!.val] {
                    newNode.neighbors.append(neighborNode)
                    neighborNode.neighbors.append(newNode)
                }
                else {
                    queue.enqueue(neighbor!)
                }
            }
        }
        
        return graph[root.val]
    }
    
    func solveDFS(_ node: GraphNode?) -> GraphNode? {
        guard let node = node else { return nil }
        
        var graph = [Int: GraphNode]()
        
        func dfs(node: GraphNode) -> GraphNode {
            if let newNode = graph[node.val] { return newNode }
            let newNode = GraphNode(node.val)
            graph[node.val] = newNode
            
            for neighbor in node.neighbors where neighbor != nil {
                newNode.neighbors.append(dfs(node: neighbor!))
            }
            
            return newNode
        }
        
        return dfs(node: node)
    }
    
}
