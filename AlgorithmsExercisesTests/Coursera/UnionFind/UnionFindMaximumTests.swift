//
//  UnionFindMaximumTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 12/10/2020.
//

import XCTest

final class UnionFindMaximumTests: XCTestCase {
    
    func testUFM() {
        let unionFind = try! UnionFindMaximum(length: 10)
        try! unionFind.union(0, 3)
        try! unionFind.union(1, 7)
        try! unionFind.union(2, 4)
        try! unionFind.union(0, 7)
        try! unionFind.union(5, 9)
        try! unionFind.union(5, 3)
        
        let expectedResult = [9,9,4,9,4,9,6,9,8,9]
        
        for i in 0..<10 {
            let maximum = try! unionFind.findMaximum(i)
            XCTAssertEqual(maximum, expectedResult[i])
        }
    }

}
