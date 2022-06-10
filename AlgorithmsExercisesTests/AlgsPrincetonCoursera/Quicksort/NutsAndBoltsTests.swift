//
//  NutsAndBoltsTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 09/11/2020.
//

import XCTest

final class NutsAndBoltsTests: XCTestCase {
    
    var nab: NutsAndBolts!
    
    override func setUp() {
        super.setUp()
        nab = NutsAndBolts()
    }
    
    override func tearDown() {
        super.tearDown()
        nab = nil
    }
    
    func testNab() {
        var nuts = [1,5,3,6,7,8,10]
        var bolts = [10,3,5,7,6,8,1]
        nab.sort(nuts: &nuts, bolts: &bolts)
        
        XCTAssertEqual(nuts, [1,3,5,6,7,8,10])
        XCTAssertEqual(bolts, [1,3,5,6,7,8,10])
    }

}
