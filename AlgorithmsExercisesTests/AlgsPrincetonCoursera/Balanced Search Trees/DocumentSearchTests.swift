//
//  DocumentSearchTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 21/02/2021.
//

import XCTest

final class DocumentSearchTests: XCTestCase {
    
    func testStandard() {
        let docSearch = DocumentSearch(document: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        let (low, high) = docSearch.findInterval(words: ["enim", "aliquip", "cillum"]) ?? (nil, nil)
        
        XCTAssertEqual(low, 20)
        XCTAssertEqual(high, 46)
    }
    
    func testBait() {
        let docSearch = DocumentSearch(document: "A B C D E A B C D E F")
        
        let (low, high) = docSearch.findInterval(words: ["A", "D", "F"]) ?? (nil, nil)
        
        XCTAssertEqual(low, 5)
        XCTAssertEqual(high, 10)
    }
    
    func testShortest() {
        let docSearch = DocumentSearch(document: "A B C D E G F A B C D E F Q")
        
        let (low, high) = docSearch.findInterval(words: ["A", "D", "F"]) ?? (nil, nil)
        
        XCTAssertEqual(low, 7)
        XCTAssertEqual(high, 12)
    }
    
}
