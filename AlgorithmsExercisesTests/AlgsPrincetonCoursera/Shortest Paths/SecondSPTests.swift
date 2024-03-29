//
//  SecondSPTests.swift
//  Created by hg on 20/03/2022.
//

import XCTest
@testable import SwiftAlgorithms

class SecondSPTests: XCTestCase {
    
    var graph: EdgeWeightedDigraph!
    var sut: SecondSP!
    
    override func setUp() {
        super.setUp()
        graph = EdgeWeightedDigraph(vertices: 8)
        sut = SecondSP()
    }
    
    override func tearDown() {
        super.tearDown()
        graph = nil
        sut = nil
    }
    
    func testPathFromZeroToOne() {
        addTestData()
        let path = sut.findSP(graph: graph, from: 0, to: 1)
        XCTAssertNil(path)
    }
    
    func testPathFromZeroToThree() {
        addTestData()
        
        let path = sut.findSP(graph: graph, from: 0, to: 3)
        
        let expected = [
            DirectedEdge(from: 0, to: 7, weight: 8),
            DirectedEdge(from: 7, to: 2, weight: 7),
            DirectedEdge(from: 2, to: 3, weight: 3)
        ]
        
        let expectedTwo = [
            DirectedEdge(from: 0, to: 7, weight: 8),
            DirectedEdge(from: 7, to: 5, weight: 6),
            DirectedEdge(from: 5, to: 2, weight: 1),
            DirectedEdge(from: 2, to: 3, weight: 3)
        ]
        
        XCTAssertTrue(path == expected || path == expectedTwo)
    }
    
    func testPathFromZeroToSeven() {
        addTestData()
        
        let path = sut.findSP(graph: graph, from: 0, to: 7)
        
        let expected = [
            DirectedEdge(from: 0, to: 1, weight: 5),
            DirectedEdge(from: 1, to: 7, weight: 4)
        ]
        
        XCTAssertEqual(path, expected)
    }
    
    func testParallelEdges() {
        addTestData()
        graph.addEdge(from: 0, to: 1, weight: 6)
        
        let path = sut.findSP(graph: graph, from: 0, to: 1)
        let expected = [DirectedEdge(from: 0, to: 1, weight: 6)]
        
        XCTAssertEqual(path, expected)
    }
    
}

extension SecondSPTests {
    
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
        
        graph.addEdge(from: 6, to: 4, weight: 1)
        
        graph.addEdge(from: 7, to: 2, weight: 7)
        graph.addEdge(from: 7, to: 5, weight: 6)
    }
    
}
