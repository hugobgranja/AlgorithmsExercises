//
//  SelectionTwoSortedArraysTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 15/11/2020.
//

import XCTest

final class SelectionTwoSortedArraysV3Tests: XCTestCase {
    
    var selection: SelectionTwoSortedArrays!
    
    override func setUp() {
        super.setUp()
        selection = SelectionTwoSortedArrays()
    }
    
    override func tearDown() {
        super.tearDown()
        selection = nil
    }
    
    func testRandom() {
        let tries = 100
        let maxSize = 20
        let maxNumber = 100

        for _ in 0...tries {
            let aSize = Int.random(in: 1...maxSize)
            let bSize = Int.random(in: 1...maxSize)
            var a = [Int]()
            var b = [Int]()
            
            for _ in 0..<aSize {
                a.append(Int.random(in: 0...maxNumber))
            }
            
            for _ in 0..<bSize {
                b.append(Int.random(in: 0...maxNumber))
            }
            
            a.sort()
            b.sort()
            let ab = (a + b).sorted()
            
            for rank in 0..<ab.count {
                let element = selection.selectV3(a, b, rank: rank)
                XCTAssertEqual(element, ab[rank])
            }
        }
    }
    
}
