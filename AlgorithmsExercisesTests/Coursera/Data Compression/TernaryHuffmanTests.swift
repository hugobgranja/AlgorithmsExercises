//
//  TernaryHuffmanTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 19/04/2022.
//

import XCTest

class HuffmanTests: XCTestCase {
    
    var sut: TernaryHuffman!
    
    override func setUp() {
        super.setUp()
        sut = TernaryHuffman()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testCompression() {
        let string = "ABRACADABRA!"
        let compressed = sut.compress(string)
        let expanded = compressed.flatMap { sut.expand(data: $0) }
        XCTAssertEqual(string, expanded)
    }

}
