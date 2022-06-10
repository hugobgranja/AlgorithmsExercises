//
//  ReachableVertexTests.swift
//  AlgorithmsExercises
//  Created by hg on 12/03/2022.
//

import XCTest
import SwiftAlgorithms

final class ReachableVertexTests: XCTestCase {

    var sut: ReachableVertex!
    
    override func setUp() {
        super.setUp()
        sut = ReachableVertex()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testExistsInDAG() {
        let graph = Digraph(vertices: 5)
        addDAGTestData(graph: graph)
        let vertex = sut.findReachableVertexInDAG(graph: graph)
        XCTAssertEqual(vertex, 4)
    }
    
    func testNotExistsInDAG() {
        let graph = Digraph(vertices: 6)
        addDAGTestData(graph: graph)
        graph.addEdge(v: 3, w: 5)
        let vertex = sut.findReachableVertexInDAG(graph: graph)
        XCTAssertNil(vertex)
    }
    
    func testExists() {
        let graph = Digraph(vertices: 8)
        addTestData(graph: graph)
        let vertex = sut.findReachableVertex(graph: graph)
        XCTAssertEqual(vertex, 5)
    }
    
    func testNotExists() {
        let graph = Digraph(vertices: 9)
        addTestData(graph: graph)
        graph.addEdge(v: 0, w: 8)
        let vertex = sut.findReachableVertex(graph: graph)
        XCTAssertNil(vertex)
    }

}

extension ReachableVertexTests {
    
    func addDAGTestData(graph: Digraph) {
        graph.addEdge(v: 0, w: 1)
        graph.addEdge(v: 0, w: 2)
        graph.addEdge(v: 1, w: 2)
        graph.addEdge(v: 1, w: 3)
        graph.addEdge(v: 2, w: 3)
        graph.addEdge(v: 2, w: 4)
        graph.addEdge(v: 3, w: 4)
    }
    
    func addTestData(graph: Digraph) {
        graph.addEdge(v: 0, w: 1)
        graph.addEdge(v: 0, w: 2)
        graph.addEdge(v: 1, w: 0)
        graph.addEdge(v: 1, w: 3)
        graph.addEdge(v: 2, w: 3)
        graph.addEdge(v: 3, w: 4)
        graph.addEdge(v: 3, w: 5)
        graph.addEdge(v: 4, w: 2)
        graph.addEdge(v: 4, w: 5)
        graph.addEdge(v: 4, w: 6)
        graph.addEdge(v: 5, w: 7)
        graph.addEdge(v: 6, w: 5)
        graph.addEdge(v: 7, w: 6)
    }
    
}


