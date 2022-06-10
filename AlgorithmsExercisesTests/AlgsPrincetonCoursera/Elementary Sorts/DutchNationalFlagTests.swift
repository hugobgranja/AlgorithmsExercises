//
//  DutchNationalFlagTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 17/10/2020.
//

import XCTest

final class DutchNationalFlagTests: XCTestCase {
    
    var dnf: DutchNationalFlag!
    
    override func setUp() {
        super.setUp()
        dnf = DutchNationalFlag()
    }
    
    override func tearDown() {
        super.tearDown()
        dnf = nil
    }
    
    func test() {
        var buckets: [Bucket] = [
            Bucket(pebble: Pebble(color: .red)),
            Bucket(pebble: Pebble(color: .red)),
            Bucket(pebble: Pebble(color: .blue)),
            Bucket(pebble: Pebble(color: .white)),
            Bucket(pebble: Pebble(color: .blue)),
            Bucket(pebble: Pebble(color: .red)),
            Bucket(pebble: Pebble(color: .white))
        ]
        
        dnf.sort(&buckets)
        XCTAssertTrue(isSorted(buckets))
    }
    
    private func isSorted<T: Comparable>(_ array: [T]) -> Bool {
        var i = 1
        while i < array.count {
            if array[i] < array[i - 1] { return false }
            i += 1
        }
        return true
    }
    
}
