//
//  IntersectionOfTwoSetsTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 17/10/2020.
//

import XCTest

final class IntersectionOfTwoSetsTests: XCTestCase {

    var intersection: Intersection!
    
    override func setUp() {
        super.setUp()
        intersection = Intersection()
    }

    override func tearDown() {
        super.tearDown()
        intersection = nil
    }
    
    func test() {
        let a = [2,5,7,8,9,1,2,0]
        let b = [1,4,7,0,2,10,12]
        let count = intersection.count(a, b)
        XCTAssertEqual(count, 4)
    }

}
