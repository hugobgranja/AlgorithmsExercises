//
//  CountingInversions.swift
//  AlgorithmsExercisesTests
//  Created by hg on 31/10/2020.
//

import XCTest

final class CountingInversionsTests: XCTestCase {

    var countingInversions: CountingInversions!
    
    override func setUp() {
        super.setUp()
        countingInversions = CountingInversions()
    }

    override func tearDown() {
        super.tearDown()
        countingInversions = nil
    }

    func testZero() {
        var a = [Int]()
        var inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 0)

        a = [1]
        inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 0)

        a = [1,2,3,4,5,6,7,8,9]
        inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 0)
    }

    func testOne() {
        let a = [2,1]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 1)
    }

    func testTwo() {
        let a = [3,1,2]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 2)
    }
    
    func testSix() {
        let a = [8,4,2,1]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 6)
    }

    func testEvenOdd() {
        let a = [0,2,4,6,8,1,3,5,7,9]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 10)
    }
    
    func testInverted() {
        let a = [5,6,7,8,9,0,1,2,3,4]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 25)
    }
    
    func testRandom() {
        let a = [8,1,2,6,7,12,18,3,0,10,23,66]
        let inversions = countingInversions.countInversions(a)
        XCTAssertEqual(inversions, 19)
    }
    
}
