//
//  RKLongestPalindromicSubstringTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 09/04/2022.
//

import XCTest

class RKLongestPalindromicSubstringTests: XCTestCase {
    
    var sut: RKLongestPalindromicSubstring!
    
    override func setUp() {
        super.setUp()
        sut = RKLongestPalindromicSubstring()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testLengthOne() {
        let text = "a"
        XCTAssertEqual(sut.lps(text: text), "a")
    }
    
    func testLengthTwo() {
        let text = "bb"
        XCTAssertEqual(sut.lps(text: text), "bb")
    }
    
    func testLengthThree() {
        let text = "aba"
        XCTAssertEqual(sut.lps(text: text), "aba")
    }
    
    func testEven() {
        let text = "xbnoonlakayaksnoonnoonpq"
        XCTAssertEqual(sut.lps(text: text), "noonnoon")
    }
    
    func testOdd() {
        let text = "xbakayakknoonlracecaraq"
        XCTAssertEqual(sut.lps(text: text), "racecar")
    }
    
    func testMultiples() {
        let text = "caacbxb"
        XCTAssertEqual(sut.lps(text: text), "caac")
    }
    
}
