//
//  MaxWeightClosureProblem.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 30/03/2022.
//

import XCTest

class MaxWeightClosureProblemTests: XCTestCase {
    
    var sut: MaxWeightClosureProblem!
    
    override func setUp() {
        super.setUp()
        sut = MaxWeightClosureProblem()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testMaxWeightClosure() {
        let vertices = createTestData()
        let closure = sut.findClosure(vertices: vertices)
        
        let expected = [
            WeightedVertex(id: 0, weight: 5),
            WeightedVertex(id: 1, weight: 8),
            WeightedVertex(id: 2, weight: -11),
        ]
        
        XCTAssertEqual(closure, expected)
    }
    
}

extension MaxWeightClosureProblemTests {
    
    func createTestData() -> [WeightedVertex] {
        let vertices = [
            WeightedVertex(id: 0, weight: 5),
            WeightedVertex(id: 1, weight: 8),
            WeightedVertex(id: 2, weight: -1),
            WeightedVertex(id: 3, weight: -6),
            WeightedVertex(id: 4, weight: -8),
            WeightedVertex(id: 5, weight: -2),
            WeightedVertex(id: 6, weight: 10),
            WeightedVertex(id: 7, weight: 5),
            WeightedVertex(id: 8, weight: -6)
        ]
        
        vertices[0].addEdge(to: vertices[2])
        vertices[1].addEdge(to: vertices[0])
        vertices[2].addEdge(to: vertices[1])
        vertices[4].addEdge(to: vertices[5])
        vertices[5].addEdge(to: vertices[6])
        vertices[6].addEdge(to: vertices[4])
        vertices[7].addEdge(to: vertices[3])
        
        return vertices
    }
    
}
