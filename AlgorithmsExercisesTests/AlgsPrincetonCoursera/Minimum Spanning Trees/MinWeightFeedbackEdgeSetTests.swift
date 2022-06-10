//
//  MinWeightFeedbackEdgeSetTests.swift
//  AlgorithmsExercises
//  Created by hg on 18/03/2022.
//

import XCTest
import SwiftAlgorithms

final class MinWeightFeedbackEdgeSetTests: XCTestCase {

    var sut: MinWeightFeedbackEdgeSet!
    
    override func setUp() {
        super.setUp()
        sut = MinWeightFeedbackEdgeSet()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCycles() {
        let graph = EdgeWeightedGraph(vertices: 7)
        graph.addEdge(v: 0, w: 1, weight: 1)
        graph.addEdge(v: 0, w: 2, weight: 2)
        graph.addEdge(v: 1, w: 3, weight: 4)
        graph.addEdge(v: 2, w: 3, weight: 2)
        graph.addEdge(v: 2, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 5, weight: 2)
        graph.addEdge(v: 4, w: 5, weight: 3)
        
        let minWeightFeedbackEdges = sut.minWeightFeedbackEdgeSet(graph: graph)
        
        let expected = [
            WeightedEdge(v: 2, w: 3, weight: 2),
            WeightedEdge(v: 3, w: 5, weight: 2),
            WeightedEdge(v: 0, w: 1, weight: 1)
        ]
        
        XCTAssertEqual(minWeightFeedbackEdges, expected)
    }
    
    func testNoCycles() {
        let graph = EdgeWeightedGraph(vertices: 7)
        graph.addEdge(v: 0, w: 1, weight: 4)
        graph.addEdge(v: 0, w: 2, weight: 2)
        graph.addEdge(v: 2, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 5, weight: 2)
        graph.addEdge(v: 4, w: 5, weight: 3)
        
        let minWeightFeedbackEdges = sut.minWeightFeedbackEdgeSet(graph: graph)
        
        XCTAssertEqual(minWeightFeedbackEdges, [])
    }

}
