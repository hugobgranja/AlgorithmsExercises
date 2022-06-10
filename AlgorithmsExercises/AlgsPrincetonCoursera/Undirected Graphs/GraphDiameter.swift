//
//  GraphDiameter.swift
//  AlgorithmsExercises
//  Created by hg on 06/03/2022.
//
//  Diameter of a tree (connected acyclic undirected graph).
//  Given a connected graph with no cycles design a linear-time algorithm to find the longest simple path in the graph.
//
//  If we run BFS from any node x and find a node with the longest distance from x, x is an endpoint of the longest path.
//  Running a second BFS from this endpoint and finding the longest distance from it should give us the second endpoint.
//  The longest path is the path connecting both endpoints.
//

import Foundation
import SwiftAlgorithms

class GraphDiameter {
    
    func findDiameter(graph: Graph) -> [Int] {
        let (_ , distances) = bfs(graph: graph, source: 0)
        let source = findLargestDistanceVertex(distances: distances)
        let (edges, distancesFromSource) = bfs(graph: graph, source: source)
        let destination = findLargestDistanceVertex(distances: distancesFromSource)
        return path(from: source, to: destination, edges: edges)
    }
    
    private func bfs(graph: Graph, source: Int) -> ([Int?], [Int?]) {
        var marked = [Bool](repeating: false, count: graph.vertexCount())
        var edgeTo = [Int?](repeating: nil, count: graph.vertexCount())
        var distTo = [Int?](repeating: nil, count: graph.vertexCount())
        
        let queue = LinkedListQueue<Int>()
        queue.enqueue(source)
        distTo[source] = 0
        marked[source] = true
        
        while let vertex = queue.dequeue() {
            for adjacentVertex in graph.adjacent(to: vertex) {
                if !marked[adjacentVertex] {
                    queue.enqueue(adjacentVertex)
                    marked[adjacentVertex] = true
                    edgeTo[adjacentVertex] = vertex
                    distTo[adjacentVertex] = distTo[vertex]! + 1
                }
            }
        }
        
        return (edgeTo, distTo)
    }
    
    private func findLargestDistanceVertex(distances: [Int?]) -> Int {
        var vertex = 0
        var maxDistance = 0
        
        for (index, distance) in distances.enumerated() {
            if let distance = distance, distance > maxDistance {
                vertex = index
                maxDistance = distance
            }
        }
        
        return vertex
    }
    
    private func path(from source: Int, to destination: Int, edges: [Int?]) -> [Int] {
        var path = [Int]()
        var w = destination
        
        while w != source {
            path.append(w)
            w = edges[w]!
        }
        
        path.append(source)
        
        return path.reversed()
    }
    
}
