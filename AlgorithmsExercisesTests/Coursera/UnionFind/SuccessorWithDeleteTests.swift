//
//  SuccessorWithDeleteTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 12/10/2020.
//

import XCTest

final class SuccessorWithDeleteTests: XCTestCase {
    
    func testSWD() {
        let successorWithDelete = try! SuccessorWithDelete(length: 10)
        try! successorWithDelete.remove(8)
        var succ = try! successorWithDelete.successor(7)
        XCTAssertEqual(succ, 9)
        try! successorWithDelete.remove(7)
        succ = try! successorWithDelete.successor(6)
        XCTAssertEqual(succ, 9)
        try! successorWithDelete.remove(9)
        succ = try! successorWithDelete.successor(7)
        XCTAssertEqual(succ, 7)
        succ = try! successorWithDelete.successor(2)
        XCTAssertEqual(succ, 3)
    }

}
