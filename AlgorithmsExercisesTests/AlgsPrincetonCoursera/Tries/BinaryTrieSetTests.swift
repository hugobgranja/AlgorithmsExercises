//
//  BinaryTrieSetTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 05/04/2022.
//

import XCTest

class BinaryTrieSetTests: XCTestCase {
    
    var sut: BinaryTrieSet!
    
    override func setUp() {
        super.setUp()
        sut = BinaryTrieSet()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testInsert() {
        addTestData()
        XCTAssertTrue(sut.count == 5)
    }
    
    func testCount() {
        XCTAssertEqual(sut.count, 0)
        addTestData()
        XCTAssertEqual(sut.count, 5)
    }
    
    func testLongestPrefix() {
        addTestData()
        let longestPrefix = sut.longestPrefix(of: "1010")
        XCTAssertEqual(longestPrefix, "10")
    }

}

extension BinaryTrieSetTests {
    
    func addTestData() {
        let array = ["01", "10", "0010", "1111", "10100"]
        for str in array { sut.insert(str) }
    }
    
}
