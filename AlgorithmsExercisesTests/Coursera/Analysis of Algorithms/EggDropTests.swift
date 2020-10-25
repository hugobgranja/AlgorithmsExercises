//
//  EggDropTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 23/10/2020.
//

import XCTest

final class EggDropTests: XCTestCase {

    var eggDrop: EggDrop!
    
    override func setUp() {
        super.setUp()
        eggDrop = EggDrop()
    }

    override func tearDown() {
        super.tearDown()
        eggDrop = nil
    }
    
    func testVersionZero() {
        let n = 1000
        let t = 899
        let building = Building(floors: n, breakFloor: t)
        let result = eggDrop.versionZero(building: building)
        
        XCTAssertEqual(result, t)
        XCTAssertLessThanOrEqual(building.brokenEggs, 1)
        XCTAssertLessThanOrEqual(building.throwCount, t)
    }
    
    func testVersionOne() {
        let n = 1000
        
        for t in 1...n {
            let building = Building(floors: n, breakFloor: t)
            let result = eggDrop.versionOne(building: building)
        
            XCTAssertEqual(result, t)
            XCTAssertLessThanOrEqual(Double(building.brokenEggs), log2(Double(n)).rounded(.up))
            XCTAssertLessThanOrEqual(Double(building.throwCount), log2(Double(n)).rounded(.up))
        }
    }
    
    func testVersionTwo() {
        let n = 1000
        
        for t in 1...n {
            let building = Building(floors: n, breakFloor: t)
            let result = eggDrop.versionTwo(building: building)
        
            XCTAssertEqual(result, t)
            XCTAssertLessThanOrEqual(Double(building.brokenEggs), log2(Double(t)).rounded(.up) + 1)
            XCTAssertLessThanOrEqual(Double(building.throwCount), 2 * log2(Double(t)).rounded(.up) + 2)
        }
    }
    
    func testVersionThree() {
        let n = 1000
        
        for t in 1...n {
            let building = Building(floors: n, breakFloor: t)
            let result = eggDrop.versionThree(building: building)
        
            XCTAssertEqual(result, t)
            XCTAssertLessThanOrEqual(building.brokenEggs, 2)
            XCTAssertLessThanOrEqual(Double(building.throwCount), 2 * sqrt(Double(n)).rounded(.up))
        }
    }
    
    func testVersionFour() {
        let n = 1000
        
        for t in 1...n {
            let building = Building(floors: n, breakFloor: t)
            let result = eggDrop.versionFour(building: building)
        
            XCTAssertEqual(result, t)
            XCTAssertLessThanOrEqual(building.brokenEggs, 2)
            XCTAssertLessThanOrEqual(Double(building.throwCount), 2 * sqrt(2) * sqrt(Double(t)))
        }
    }

}
