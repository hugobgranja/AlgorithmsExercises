//
//  GraphCenter.swift
//  AlgorithmsExercises
//  Created by hg on 06/03/2022.
//
//  Center of a tree.
//  Given a connected graph with no cycles design a linear-time algorithm to find a vertex such that its maximum distance from any other vertex is minimized.
//
//  The center of a tree is a vertex with minimal eccentricity.
//  The eccentricity of a vertex X in a tree G is the maximum distance between the vertex X and any other vertex of the tree.
//  The maximum eccentricity is the tree diameter.
//  If a tree has only one center, it is called Central Tree and if a tree has only more than one centers, it is called Bi-central Tree.
//

import Foundation
import SwiftAlgorithms

class GraphCenter {
    
    private let diameter: GraphDiameter
    
    init(diameter: GraphDiameter) {
        self.diameter = diameter
    }
    
    func findCenter(graph: Graph) -> [Int] {
        guard graph.vertexCount() > 0 else { return [] }
        
        let diameter = diameter.findDiameter(graph: graph)
        let mid = diameter.count / 2
        let center = diameter[mid]
        
        if diameter.count.isMultiple(of: 2) {
            let bicenter = diameter[mid - 1]
            return [bicenter, center]
        }
        
        return [center]
    }
    
}
