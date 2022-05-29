//
//  TwoSumTests.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/03/2022.
//

import XCTest

final class TwoSumTests: XCTestCase {

    var sut: TwoSum!
    
    override func setUp() {
        super.setUp()
        sut = TwoSum()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testLSD() {
        var array = [2,12,9,5,2,0,10,-8]
        
        guard let (n, p) = sut.findWithLSD(&array, target: -3) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(n, -8)
        XCTAssertEqual(p, 5)
    }
    
    func testLSDDistinct() {
        var array = [3]
        let result = sut.findWithLSD(&array, target: 6)
        XCTAssertNil(result)
    }
    
    func testMap() {
        let array = [2,12,9,5,2,0,10,-8]
        
        guard let (n, p) = sut.find(array, target: -3) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(n, 5)
        XCTAssertEqual(p, -8)
    }
    
    func testMapDistinct() {
        let array = [3]
        let result = sut.find(array, target: 6)
        XCTAssertNil(result)
    }

}
