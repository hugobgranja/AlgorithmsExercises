//
//  ThreeSumTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 18/10/2020.
//

import XCTest

final class ThreeSumTests: XCTestCase {

    var threeSum: ThreeSum!
    
    override func setUp() {
        super.setUp()
        threeSum = ThreeSum()
    }

    override func tearDown() {
        super.tearDown()
        threeSum = nil
    }
    
    func test() {
        let a = [2,5,7,8,9,1,2,0]
        
        guard let (n, o, p) = threeSum.find(a, sum: 14) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(n, 0)
        XCTAssertEqual(o, 5)
        XCTAssertEqual(p, 9)
    }

}
