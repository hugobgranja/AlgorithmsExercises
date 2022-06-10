//
//  SelectionTwoSortedArraysTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 15/11/2020.
//

import XCTest

final class SelectionTwoSortedArraysV1Tests: XCTestCase {
    
    var selection: SelectionTwoSortedArrays!
    
    override func setUp() {
        super.setUp()
        selection = SelectionTwoSortedArrays()
    }
    
    override func tearDown() {
        super.tearDown()
        selection = nil
    }
    
    func testZero() {
        let a = [1]
        let b = [2]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 2)
    }
    
    func testOne() {
        let a = [1,2]
        let b = [2,2]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 2)
    }
    
    func testTwo() {
        let a = [1,2,3,4,5]
        let b = [1,1,1,1,1]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 1)
    }

    func testThree() {
        let a = [1,3,5,7,9]
        let b = [0,2,4,6,8]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 5)
    }

    func testFour() {
        let a = [2,2,2,2,2,2,2,2,3,4]
        let b = [1,2,4,4,5,6,7,8,9,10]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 3)
    }
    
    func testFive() {
        let a = [1,2,3,4,5]
        let b = [4,6,7,9,10]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 5)
    }
    
    func testSix() {
        let a = [1,2,3]
        let b = [4,5,6]
        let element = selection.selectV1(a, b)
        XCTAssertEqual(element, 4)
    }

}
