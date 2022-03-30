//
//  FattestPathsTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 29/03/2022.
//

import XCTest
@testable import SwiftAlgorithms

class FattestPathTests: XCTestCase {
    
    var graph: EdgeWeightedDigraph!
    
    override func setUp() {
        super.setUp()
        graph = EdgeWeightedDigraph(vertices: 8)
    }
    
    override func tearDown() {
        super.tearDown()
        graph = nil
    }
    
    func testPathFromZeroToOne() {
        addTestData()
        let fattestPath = FattestPath(graph: graph, source: 0, destination: 1)
        let expected = [DirectedEdge(from: 0, to: 1, weight: 5)]
        XCTAssertEqual(fattestPath.path(), expected)
    }
    
    func testPathFromZeroToThree() {
        addTestData()
        
        let fattestPath = FattestPath(graph: graph, source: 0, destination: 3)
        
        let expected = [
            DirectedEdge(from: 0, to: 1, weight: 5),
            DirectedEdge(from: 1, to: 3, weight: 15)
        ]
        
        XCTAssertEqual(fattestPath.path(), expected)
    }
    
    func testPathFromZeroToSix() {
        addTestData()
        
        let fattestPath = FattestPath(graph: graph, source: 0, destination: 6)
        
        let expected = [
            DirectedEdge(from: 0, to: 4, weight: 9),
            DirectedEdge(from: 4, to: 6, weight: 20)
        ]
        
        XCTAssertEqual(fattestPath.path(), expected)
    }
    
}

extension FattestPathTests {
    
    func addTestData() {
        graph.addEdge(from: 0, to: 1, weight: 5)
        graph.addEdge(from: 0, to: 4, weight: 9)
        graph.addEdge(from: 0, to: 7, weight: 8)
        
        graph.addEdge(from: 1, to: 2, weight: 12)
        graph.addEdge(from: 1, to: 3, weight: 15)
        graph.addEdge(from: 1, to: 7, weight: 4)
        
        graph.addEdge(from: 2, to: 3, weight: 3)
        graph.addEdge(from: 2, to: 6, weight: 11)
        
        graph.addEdge(from: 3, to: 6, weight: 9)
        
        graph.addEdge(from: 4, to: 5, weight: 4)
        graph.addEdge(from: 4, to: 6, weight: 20)
        graph.addEdge(from: 4, to: 7, weight: 5)
        
        graph.addEdge(from: 5, to: 2, weight: 1)
        graph.addEdge(from: 5, to: 6, weight: 13)
        
        graph.addEdge(from: 7, to: 2, weight: 7)
        graph.addEdge(from: 7, to: 5, weight: 6)
    }
    
}

