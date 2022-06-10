//
//  SuccessorWithDeleteTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 12/10/2020.
//

import XCTest

final class SuccessorWithDeleteTests: XCTestCase {
    
    func testSWD() {
        let successorWithDelete = SuccessorWithDelete(length: 10)
        successorWithDelete.remove(8)
        var succ = successorWithDelete.successor(7)
        XCTAssertEqual(succ, 9)
        successorWithDelete.remove(7)
        succ = successorWithDelete.successor(6)
        XCTAssertEqual(succ, 9)
        successorWithDelete.remove(9)
        succ = successorWithDelete.successor(7)
        XCTAssertEqual(succ, 7)
        succ = successorWithDelete.successor(2)
        XCTAssertEqual(succ, 3)
    }

}
