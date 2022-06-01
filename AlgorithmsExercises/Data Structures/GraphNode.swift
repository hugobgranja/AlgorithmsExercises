//
//  GraphNode.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//

import Foundation

class GraphNode {
    
    var val: Int
    var neighbors: [GraphNode?]
    
    init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
    
}
