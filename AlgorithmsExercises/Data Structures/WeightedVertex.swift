//
//  WeightedVertex.swift
//  AlgorithmsExercises
//  Created by hg on 30/03/2022.
//

import Foundation

class WeightedVertex {
    
    let id: Int
    let weight: Decimal
    var adjacent: [WeightedVertex]
    
    init(id: Int, weight: Decimal) {
        self.id = id
        self.weight = weight
        self.adjacent = []
    }
    
    func addEdge(to vertex: WeightedVertex) {
        adjacent.append(vertex)
    }
    
}

extension WeightedVertex: Equatable {
    
    static func == (lhs: WeightedVertex, rhs: WeightedVertex) -> Bool {
        return lhs.id == rhs.id
    }
    
}

extension WeightedVertex: CustomStringConvertible {
    
    var description: String {
        return "\(id)"
    }
    
}
