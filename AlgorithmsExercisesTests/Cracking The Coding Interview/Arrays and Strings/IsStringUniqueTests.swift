//
//  IsStringUniqueTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 16/02/2022.
//

import XCTest

final class IsStringUniqueTests: XCTestCase {

    var sut: IsStringUnique!
    
    override func setUp() {
        super.setUp()
        sut = IsStringUnique()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testWhenUnique() {
        let str = "qwertyuiopasdfghjklzxcvbnm"
        XCTAssertTrue(sut.isUniqueV1(str: str))
        XCTAssertTrue(sut.isUniqueV2(str: str))
    }
    
    func testWhenNotUnique() {
        let str = "qwertyuiopasdfghjkalzxcvbnm"
        XCTAssertFalse(sut.isUniqueV1(str: str))
        XCTAssertFalse(sut.isUniqueV2(str: str))
    }

}
