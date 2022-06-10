//
//  BitonicArrayTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 18/10/2020.
//

import XCTest

final class BitonicArrayTests: XCTestCase {

    var bitonicArray: BitonicArray!
    
    override func setUp() {
        super.setUp()
        bitonicArray = BitonicArray()
    }

    override func tearDown() {
        super.tearDown()
        bitonicArray = nil
    }
    
    func testEmpty() {
        let a = [Int]()
        let contains = bitonicArray.contains(a, 5)
        XCTAssertFalse(contains)
    }
    
    func test() {
        let a = [4,7,8,10,16,12,9,7,0]
        let contains = [Int](0...16).map { bitonicArray.contains(a, $0) }
        let expectedResult = [true, false, false, false, true, false, false, true, true, true, true, false, true, false, false, false, true]
        XCTAssertEqual(contains, expectedResult)
    }

}
