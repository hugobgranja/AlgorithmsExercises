//
//  AmericanFlagSortTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 31/03/2022.
//

import XCTest

class AmericanFlagSortTests: XCTestCase {
    
    var sut: AmericanFlagSort!
    
    override func setUp() {
        super.setUp()
        sut = AmericanFlagSort()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testSort() {
        var array = [
            ("42", 5), ("77", 10), ("70", 9),
            ("21", 2), ("7", 0), ("14", 1),
            ("49", 6), ("56", 7), ("63", 8),
            ("35", 4), ("28", 3), ("42", 5),
            ("7", 0), ("56", 7), ("35", 4)
        ]
        
        let expected = [
            ("7", 0), ("7", 0), ("14", 1),
            ("21", 2), ("28", 3), ("35", 4),
            ("35", 4), ("42", 5), ("42", 5),
            ("49", 6), ("56", 7), ("56", 7),
            ("63", 8), ("70", 9), ("77", 10)
        ]
        
        sut.sort(&array, radix: 11)
        XCTAssertEqual(array.map { $0.0 }, expected.map { $0.0 })
        XCTAssertEqual(array.map { $0.1 }, expected.map { $0.1 })
    }

}
