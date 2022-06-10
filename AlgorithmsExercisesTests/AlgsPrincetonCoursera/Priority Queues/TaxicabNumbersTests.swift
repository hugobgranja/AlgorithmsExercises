//
//  TaxicabNumbersTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 27/12/2020.
//

import XCTest

final class TaxicabNumbersTests: XCTestCase {
    
    var txnumbers: TaxicabNumbers!
    
    // http://oeis.org/A001235/
    let numbers = [
        1729,4104,13832,20683,32832,39312,40033,46683,
        64232,65728,110656,110808,134379,149389,165464,
        171288,195841,216027,216125,262656,314496,320264,
        327763,373464,402597,439101,443889,513000,513856,
        515375,525824,558441,593047,684019,704977
    ]
    
    override func setUp() {
        super.setUp()
        txnumbers = TaxicabNumbers()
    }
    
    override func tearDown() {
        super.tearDown()
        txnumbers = nil
    }
    
    func testV1() {
        let foundNumbers = txnumbers.findV1(n: 90)
        XCTAssertEqual(foundNumbers, numbers)
    }
    
    func testV2() {
        let foundNumbers = txnumbers.findV2(n: 90)
        XCTAssertEqual(foundNumbers, numbers)
    }
    
}
