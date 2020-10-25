//
//  SmallerAuxArrayTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 30/10/2020.
//

import XCTest

final class SmallerAuxArrayTests: XCTestCase {

    var smallerAuxArray: MergeSmallerAuxArray!
    
    override func setUp() {
        super.setUp()
        smallerAuxArray = MergeSmallerAuxArray()
    }

    override func tearDown() {
        super.tearDown()
        smallerAuxArray = nil
    }
    
    func testInterleaved() {
        var a = [0,2,4,6,8,1,3,5,7,9]
        smallerAuxArray.merge(&a, 0, 4, 9)
        XCTAssertEqual(a, [0,1,2,3,4,5,6,7,8,9])
    }
    
    func testInvertedOrder() {
        var a = [5,6,7,8,9,0,1,2,3,4]
        smallerAuxArray.merge(&a, 0, 4, 9)
        XCTAssertEqual(a, [0,1,2,3,4,5,6,7,8,9])
    }
    
    func testSorted() {
        var a = [0,1,2,3,4,5,6,7,8,9]
        smallerAuxArray.merge(&a, 0, 4, 9)
        XCTAssertEqual(a, [0,1,2,3,4,5,6,7,8,9])
    }

}
