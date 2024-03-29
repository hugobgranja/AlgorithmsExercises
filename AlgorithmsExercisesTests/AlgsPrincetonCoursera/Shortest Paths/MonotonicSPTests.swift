//
//  MonotonicSPTests.swift
//  Created by hg on 20/03/2022.
//

import XCTest
@testable import SwiftAlgorithms

class MonotonicSPTests: XCTestCase {
    
    var graph: EdgeWeightedDigraph!
    
    override func setUp() {
        super.setUp()
        graph = EdgeWeightedDigraph(vertices: 8)
    }
    
    override func tearDown() {
        super.tearDown()
        graph = nil
    }

    func testHasPath() {
        addMonotonicAscendingTestValues()
        let sp = MonotonicSP(graph: graph, source: 0)
        XCTAssertTrue(sp.hasPath(to: 5))
        XCTAssertTrue(sp.hasPath(to: 2))
        XCTAssertTrue(sp.hasPath(to: 3))
        XCTAssertTrue(sp.hasPath(to: 4))
        XCTAssertTrue(sp.hasPath(to: 7))
        XCTAssertTrue(sp.hasPath(to: 1))
        XCTAssertTrue(sp.hasPath(to: 6))
    }
    
    func testDistance() {
        addMonotonicAscendingTestValues()
        let sp = MonotonicSP(graph: graph, source: 0)
        XCTAssertEqual(sp.distance(to: 0), 0)
        XCTAssertEqual(sp.distance(to: 1), 5)
        XCTAssertEqual(sp.distance(to: 2), 17)
        XCTAssertEqual(sp.distance(to: 3), 20)
        XCTAssertEqual(sp.distance(to: 4), 9)
        XCTAssertEqual(sp.distance(to: 5), 17)
        XCTAssertEqual(sp.distance(to: 6), 30)
        XCTAssertEqual(sp.distance(to: 7), 8)
    }
    
    func testPathToOne() {
        addMonotonicAscendingTestValues()
        let sp = MonotonicSP(graph: graph, source: 0)
        let expected = [DirectedEdge(from: 0, to: 1, weight: 5)]
        XCTAssertEqual(sp.path(to: 1), expected)
    }
    
    func testPathToThree() {
        addMonotonicAscendingTestValues()
        
        let sp = MonotonicSP(graph: graph, source: 0)
        
        let expected = [
            DirectedEdge(from: 0, to: 1, weight: 5),
            DirectedEdge(from: 1, to: 3, weight: 15)
        ]
        
        XCTAssertEqual(sp.path(to: 3), expected)
    }
    
    func testPathToSix() {
        addMonotonicAscendingTestValues()
        
        let sp = MonotonicSP(graph: graph, source: 0)
        
        let expected = [
            DirectedEdge(from: 0, to: 7, weight: 8),
            DirectedEdge(from: 7, to: 5, weight: 9),
            DirectedEdge(from: 5, to: 6, weight: 13)
        ]
        
        XCTAssertEqual(sp.path(to: 6), expected)
    }
    
    func testHasMonotonicPath() {
        addMonotonicAscendingTestValues()
        let sp = MonotonicSP(graph: graph, source: 0)
        XCTAssertTrue(sp.hasMonotonicPath())
    }
    
    func testHasMonotonicPathWhenNotExists() {
        addNonMonotonicTestValues()
        let sp = MonotonicSP(graph: graph, source: 0)
        XCTAssertFalse(sp.hasMonotonicPath())
    }
    
}

extension MonotonicSPTests {
    
    func addMonotonicAscendingTestValues() {
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
        graph.addEdge(from: 4, to: 6, weight: 22)
        graph.addEdge(from: 4, to: 7, weight: 5)
        
        graph.addEdge(from: 5, to: 2, weight: 1)
        graph.addEdge(from: 5, to: 6, weight: 13)
        
        graph.addEdge(from: 6, to: 4, weight: 1)
        
        graph.addEdge(from: 7, to: 2, weight: 7)
        graph.addEdge(from: 7, to: 5, weight: 9)
    }
    
    func addNonMonotonicTestValues() {
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
