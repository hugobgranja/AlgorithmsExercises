//
//  PrefixFreeCodesTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 05/04/2022.
//

import XCTest

class PrefixFreeCodesTests: XCTestCase {
    
    var trieSet: BinaryTrieSet!
    var sut: PrefixFreeCodes!
    
    override func setUp() {
        super.setUp()
        trieSet = BinaryTrieSet()
        sut = PrefixFreeCodes()
    }
    
    override func tearDown() {
        super.tearDown()
        trieSet = nil
        sut = nil
    }
    
    func testPrefixFree() {
        let testData = Set(["01", "10", "0010", "1111"])
        XCTAssertTrue(sut.isPrefixFree(set: testData))
    }
    
    func testNotPrefixFree() {
        let testData = Set(["01", "10", "0010", "10100"])
        XCTAssertFalse(sut.isPrefixFree(set: testData))
    }
    
}
