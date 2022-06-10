//
//  IsEdgeInMSTTests.swift
//  AlgorithmsExercises
//  Created by hg on 17/03/2022.
//

import XCTest
import SwiftAlgorithms

final class IsEdgeInMSTTests: XCTestCase {

    var sut: IsEdgeInMST!
    
    override func setUp() {
        super.setUp()
        sut = IsEdgeInMST()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testNoCycle() {
        let graph = EdgeWeightedGraph(vertices: 4)
        graph.addEdge(v: 0, w: 1, weight: 1)
        graph.addEdge(v: 1, w: 2, weight: 1)
        graph.addEdge(v: 2, w: 3, weight: 2)
        
        let edge = WeightedEdge(v: 1, w: 2, weight: 1)
        
        XCTAssertTrue(sut.isEdgeInMST(graph: graph, edge: edge))
    }
    
    func testCycleIn() {
        let graph = EdgeWeightedGraph(vertices: 7)
        graph.addEdge(v: 0, w: 1, weight: 4)
        graph.addEdge(v: 0, w: 2, weight: 2)
        graph.addEdge(v: 1, w: 3, weight: 4)
        graph.addEdge(v: 2, w: 3, weight: 2)
        graph.addEdge(v: 2, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 5, weight: 2)
        graph.addEdge(v: 4, w: 5, weight: 3)
        
        let edge = WeightedEdge(v: 4, w: 5, weight: 3)
        
        XCTAssertTrue(sut.isEdgeInMST(graph: graph, edge: edge))
    }
    
    func testCycleOut() {
        let graph = EdgeWeightedGraph(vertices: 7)
        graph.addEdge(v: 0, w: 1, weight: 4)
        graph.addEdge(v: 0, w: 2, weight: 2)
        graph.addEdge(v: 1, w: 3, weight: 4)
        graph.addEdge(v: 2, w: 3, weight: 2)
        graph.addEdge(v: 2, w: 4, weight: 2)
        graph.addEdge(v: 3, w: 4, weight: 4)
        graph.addEdge(v: 3, w: 5, weight: 2)
        graph.addEdge(v: 4, w: 5, weight: 3)
        
        let edge = WeightedEdge(v: 4, w: 5, weight: 3)
        
        XCTAssertFalse(sut.isEdgeInMST(graph: graph, edge: edge))
    }

}
