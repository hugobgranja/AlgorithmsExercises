//
//  PerfectMatchingsTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 29/03/2022.
//

import XCTest

class PerfectMatchingsTests: XCTestCase {
    
    var sut: PerfectMatchings!
    
    override func setUp() {
        super.setUp()
        sut = PerfectMatchings()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testMaxFlow() {
        let n = 20
        let k = 2
        
        let maxFlow = sut.maxFlow(n: n, k: k)
        
        XCTAssertEqual(maxFlow, Decimal(n))
    }
    
}
