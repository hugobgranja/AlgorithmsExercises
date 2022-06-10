//
//  PermutationTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 17/10/2020.
//

import XCTest

final class PermutationTests: XCTestCase {

    var isPermutation: IsPermutation!
    
    override func setUp() {
        super.setUp()
        isPermutation = IsPermutation()
    }

    override func tearDown() {
        super.tearDown()
        isPermutation = nil
    }
    
    func test() {
        let a = [1,2,3,4,5,7,8,9]
        let b = [9,8,7,6,5,3,2,1]
        var solution = isPermutation.isPermutation(a,b)
        XCTAssertFalse(solution)
        
        let c = [9,8,7,5,3,4,2,1]
        solution = isPermutation.isPermutation(a,c)
        XCTAssertTrue(solution)
    }

}
