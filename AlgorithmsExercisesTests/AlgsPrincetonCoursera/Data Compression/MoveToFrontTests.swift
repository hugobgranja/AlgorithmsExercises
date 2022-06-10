//
//  MoveToFrontTests.swift
//  Created by hg on 20/04/2022.
//

import XCTest
import SwiftAlgorithms

class MoveToFrontTests: XCTestCase {
    
    var sut: MoveToFront!
    
    override func setUp() {
        super.setUp()
        sut = MoveToFront()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCompression() {
        let string = "BANANAAA"
        let compressed = sut.compress(string)
        let reader = BinaryDataReader(data: compressed)
        let expected = [66, 66, 78, 1, 1, 1, 0, 0]
        
        for value in expected {
            let int = reader.readInt(bitWidth: 8)
            XCTAssertEqual(value, int)
        }
    }
    
    func testExpansion() {
        let string = "BANANAAA"
        let compressed = sut.compress(string)
        let expanded = sut.expand(data: compressed)
        XCTAssertEqual(string, expanded)
    }

}
