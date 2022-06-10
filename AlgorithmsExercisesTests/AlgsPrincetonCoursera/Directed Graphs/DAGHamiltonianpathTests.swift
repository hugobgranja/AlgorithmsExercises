//
//  DAGHamiltonianpathTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 12/03/2022.
//

import XCTest
import SwiftAlgorithms

final class DAGHamiltonianPathTests: XCTestCase {

    var sut: DAGHamiltonianPath!
    
    override func setUp() {
        super.setUp()
        sut = DAGHamiltonianPath()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenPathExists() {
        let graph = Digraph(vertices: 5)
        addTestData(graph: graph)
        let path = sut.findHamiltonianPath(graph: graph)
        XCTAssertEqual(path, [0,1,2,3,4])
    }
    
    func testWhenPathNotExists() {
        let graph = Digraph(vertices: 6)
        addTestData(graph: graph)
        graph.addEdge(v: 3, w: 5)
        let path = sut.findHamiltonianPath(graph: graph)
        XCTAssertNil(path)
    }

}

extension DAGHamiltonianPathTests {
    
    func addTestData(graph: Digraph) {
        graph.addEdge(v: 0, w: 1)
        graph.addEdge(v: 0, w: 2)
        graph.addEdge(v: 1, w: 2)
        graph.addEdge(v: 1, w: 3)
        graph.addEdge(v: 2, w: 3)
        graph.addEdge(v: 2, w: 4)
        graph.addEdge(v: 3, w: 4)
    }
    
}
