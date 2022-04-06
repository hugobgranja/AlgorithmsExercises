//
//  CyclicRotationsTests.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/04/2022.
//

import XCTest

class CyclicRotationsTests: XCTestCase {
    
    var sut: CyclicRotations!
    
    override func setUp() {
        super.setUp()
        sut = CyclicRotations()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testExists() {
        let array = [
            "algorithms", "polynomial", "sortsuffix", "boyermoore",
            "structures", "minimumcut", "suffixsort", "stackstack",
            "binaryheap", "digraphdfs", "stringsort", "digraphbfs"
        ]
        
        let length = array[0].count

        XCTAssertTrue(sut.exists(array, length: length))
    }
    
    func testNotExists() {
        let array = [
            "algorithms", "polynomial", "sortsuffix", "boyermoore",
            "structures", "minimumcut", "soffixsort", "stackstack",
            "binaryheap", "digraphdfs", "stringsort", "digraphbfs"
        ]
        
        let length = array[0].count

        XCTAssertFalse(sut.exists(array, length: length))
    }

}
