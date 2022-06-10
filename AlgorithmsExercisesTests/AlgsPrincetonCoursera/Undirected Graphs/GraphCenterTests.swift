//
//  GraphCenterTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 07/03/2022.
//

import XCTest
import SwiftAlgorithms

final class GraphCenterTests: XCTestCase {

    var graph: UndirectedGraph!
    var sut: GraphCenter!
    
    override func setUp() {
        super.setUp()
        graph = UndirectedGraph(vertices: 10)
        sut = GraphCenter(diameter: GraphDiameter())
    }

    override func tearDown() {
        super.tearDown()
        graph = nil
        sut = nil
    }
    
    func testCenter() {
        graph.addEdge(v: 0, w: 1)
        graph.addEdge(v: 1, w: 2)
        graph.addEdge(v: 1, w: 6)
        graph.addEdge(v: 2, w: 3)
        graph.addEdge(v: 2, w: 4)
        graph.addEdge(v: 2, w: 9)
        graph.addEdge(v: 4, w: 5)
        graph.addEdge(v: 6, w: 7)
        graph.addEdge(v: 6, w: 8)
        
        let center = sut.findCenter(graph: graph)
        XCTAssertEqual(center, [2, 1])
    }

}
