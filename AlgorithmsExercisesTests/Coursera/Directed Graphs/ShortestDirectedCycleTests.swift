//
//  ShortestDirectedCycleTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 11/03/2022.
//

import XCTest
import SwiftAlgorithms

final class ShortestDirectedCycleTests: XCTestCase {

    var graph: Digraph!
    var sut: ShortestDirectedCycle!
    
    override func setUp() {
        super.setUp()
        graph = Digraph(vertices: 10)
        sut = ShortestDirectedCycle()
    }

    override func tearDown() {
        super.tearDown()
        graph = nil
        sut = nil
    }
    
    func testCycle() {
        addTestData()
        let path = sut.findShortestCycle(graph: graph)
        XCTAssertEqual(path, [0,1,0])
    }

}

extension ShortestDirectedCycleTests {
    
    func addTestData() {
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

