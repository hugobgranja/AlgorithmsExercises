//
//  SelectionTwoSortedArraysV2Tests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 02/12/2020.
//

import XCTest

final class SelectionTwoSortedArraysV2Tests: XCTestCase {
    
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
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 2)
    }
    
    func testOne() {
        let a = [1,2]
        let b = [2,2]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 2)
    }
    
    func testTwo() {
        let a = [1,2,3,4,5]
        let b = [1,1,1,1,1]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 1)
    }

    func testThree() {
        let a = [1,3,5,7,9]
        let b = [0,2,4,6,8]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 5)
    }

    func testFour() {
        let a = [2,2,2,2,2,2,2,2,3,4]
        let b = [1,2,4,4,5,6,7,8,9,10]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 3)
    }
    
    func testFive() {
        let a = [1,2,3,4,5]
        let b = [4,6,7,9,10]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 5)
    }
    
    func testSix() {
        let a = [1,2,3]
        let b = [4,5,6]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 4)
    }
    
    func testSeven() {
        let a = [4,5]
        let b = [1,2,3,4,5,6]
        let element = selection.selectV2(a,b)
        XCTAssertEqual(element, 4)
    }
    
    func testEight() {
        let a = [0,7,8,9,10,11,14,16,19,20]
        let b = [5,7]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 10)
    }
    
    func testNine() {
        let a = [3,7,15]
        let b = [18]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 15)
    }
    
    func testTen() {
        let a = [1,2,3,4,5,6,7,8,9]
        let b = [10]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 6)
    }
    
    func testEleven() {
        let a = [0]
        let b = [1,2,3,4,5,6,7,8,9]
        let element = selection.selectV2(a, b)
        XCTAssertEqual(element, 5)
    }

}
