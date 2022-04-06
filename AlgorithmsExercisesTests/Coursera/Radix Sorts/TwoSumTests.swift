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
    
    func test() {
        let array = [2,12,9,5,2,0,10,-8]
        
        guard let (n, p) = sut.find(array, target: -3) else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(n, 5)
        XCTAssertEqual(p, -8)
    }

}
