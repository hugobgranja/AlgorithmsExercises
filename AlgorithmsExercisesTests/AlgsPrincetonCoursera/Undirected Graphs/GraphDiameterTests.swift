//
//  GraphDiameterTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 06/03/2022.
//

import XCTest
import SwiftAlgorithms

final class GraphDiameterTests: XCTestCase {

    var graph: UndirectedGraph!
    var sut: GraphDiameter!
    
    override func setUp() {
        super.setUp()
        graph = UndirectedGraph(vertices: 10)
        sut = GraphDiameter()
    }

    override func tearDown() {
        super.tearDown()
        graph = nil
        sut = nil
    }
    
    func testDiameter() {
        graph.addEdge(v: 0, w: 1)
        graph.addEdge(v: 1, w: 2)
        graph.addEdge(v: 1, w: 6)
        graph.addEdge(v: 2, w: 3)
        graph.addEdge(v: 2, w: 4)
        graph.addEdge(v: 2, w: 9)
        graph.addEdge(v: 4, w: 5)
        graph.addEdge(v: 6, w: 7)
        graph.addEdge(v: 6, w: 8)
        
        let path = sut.findDiameter(graph: graph)
        XCTAssertEqual(path, [5,4,2,1,6,7])
    }

}
