//
//  CyclicRotationsSearch.swift
//  AlgorithmsExercisesTests
//  Created by hg on 07/04/2022.
//

import XCTest

class CyclicRotationsSearchTests: XCTestCase {
    
    var sut: CyclicRotationsSearch!
    
    override func setUp() {
        super.setUp()
        sut = CyclicRotationsSearch()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testIsCyclicRotation() {
        XCTAssertTrue(sut.isCyclicRotation("winterbreak", "breakwinter"))
    }
    
    func testIsNotCyclicRotation() {
        XCTAssertFalse(sut.isCyclicRotation("winterbreak", "bleakwinter"))
    }
    
}
