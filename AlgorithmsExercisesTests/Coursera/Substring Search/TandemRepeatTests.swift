//
//  TandemRepeatTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 07/04/2022.
//

import XCTest

class TandemRepeatTests: XCTestCase {
    
    var sut: TandemRepeat!
    
    override func setUp() {
        super.setUp()
        sut = TandemRepeat()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testTandemRepeat() {
        let text = "abcabcababcababc"
        let base = "abcab"
        let maxTandemRepeat = sut.findMaxTandemRepeat(in: text, of: base)
        XCTAssertEqual(maxTandemRepeat, "abcababcab")
    }
    
    func testTandemRepeatEnd() {
        let text = "abcabcabcababcab"
        let base = "abcab"
        let maxTandemRepeat = sut.findMaxTandemRepeat(in: text, of: base)
        XCTAssertEqual(maxTandemRepeat, "abcababcab")
    }
    
    func testNoTandemRepeat() {
        let text = "abcabcababcaba"
        let base = "abcac"
        let maxTandemRepeat = sut.findMaxTandemRepeat(in: text, of: base)
        XCTAssertNil(maxTandemRepeat)
    }
    
}
