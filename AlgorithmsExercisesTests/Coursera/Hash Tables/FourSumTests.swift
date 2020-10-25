//
//  FourSumTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 20/03/2021.
//

import XCTest

final class FourSumTests: XCTestCase {
    
    var fourSum: FourSum!
    
    override func setUp() {
        super.setUp()
        fourSum = FourSum()
    }
    
    override func tearDown() {
        super.tearDown()
        fourSum = nil
    }
    
    func testNotExists() {
        let exists = fourSum.exists([0,1,2,4])
        XCTAssertFalse(exists)
    }
    
    func testExists() {
        let exists = fourSum.exists([0,1,2,3,4])
        XCTAssertTrue(exists)
    }
    
    func testSolve() {
        let result = fourSum.solve([0,1,2,3,4])
        let expectation = [(0, 3, 1, 2), (0, 4, 1, 3), (1, 4, 2, 3)]
        
        XCTAssertTrue(result.count == expectation.count)
        
        for i in 0..<result.count {
            XCTAssertTrue(result[i] == expectation[i])
        }
    }
    
}
