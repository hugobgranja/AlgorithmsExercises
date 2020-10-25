//
//  DecimalDominantsTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 19/12/2020.
//

import XCTest

final class DecimalDominantsTests: XCTestCase {
    
    var decdom: DecimalDominants!
    
    override func setUp() {
        super.setUp()
        decdom = DecimalDominants()
    }
    
    override func tearDown() {
        super.tearDown()
        decdom = nil
    }
    
    func testOne() {
        var a = [39,20,1,44,53,61,58,62,71,72,86,100,73]
        XCTAssertEqual(decdom.findV0(a), [])
        XCTAssertEqual(decdom.findV1(a), [])
        XCTAssertEqual(decdom.findV2(&a), [])
    }
    
    func testTwo() {
        var a = [9,1,24,25,8,18,3,15,11,27,91,34,54,88,73,96,54,69,74]
        XCTAssertEqual(decdom.findV0(a), [54])
        XCTAssertEqual(decdom.findV1(a), [54])
        XCTAssertEqual(decdom.findV2(&a), [54])
    }
    
    func testThree() {
        var a = [24,3,45,24]
        XCTAssertEqual(decdom.findV0(a).sorted(), [3,24,45])
        XCTAssertEqual(decdom.findV1(a).sorted(), [3,24,45])
        XCTAssertEqual(decdom.findV2(&a).sorted(), [3,24,45])
    }
    
    func testFour() {
        var a = [4,54,64,65,80,89]
        XCTAssertEqual(decdom.findV0(a).sorted(), [4,54,64,65,80,89])
        XCTAssertEqual(decdom.findV1(a).sorted(), [4,54,64,65,80,89])
        XCTAssertEqual(decdom.findV2(&a).sorted(), [4,54,64,65,80,89])
    }
    
    func testFive() {
        var a = [0,1,2,3,4,5,6,7,8,9,10,0]
        XCTAssertEqual(decdom.findV0(a).sorted(), [0])
        XCTAssertEqual(decdom.findV1(a).sorted(), [0])
        XCTAssertEqual(decdom.findV2(&a).sorted(), [0])
    }
    
    func testRandom() {
        let tries = 100
        let maxSize = 20
        let maxNumber = 100
        let decdom = DecimalDominants()

        for _ in 0...tries {
            let aSize = Int.random(in: 1...maxSize)
            var a = [Int]()
            
            for _ in 0..<aSize {
                a.append(Int.random(in: 0...maxNumber))
            }
            
            let resultZero = decdom.findV0(a).sorted()
            let resultOne = decdom.findV1(a).sorted()
            let resultTwo = decdom.findV2(&a).sorted()
            XCTAssertEqual(resultZero, resultOne)
            XCTAssertEqual(resultZero, resultTwo)
        }
    }

}
