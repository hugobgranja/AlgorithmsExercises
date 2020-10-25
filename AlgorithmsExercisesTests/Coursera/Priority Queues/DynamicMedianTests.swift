//
//  DynamicMedianTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 26/12/2020.
//

import XCTest

final class DynamicMedianTests: XCTestCase {
    
    var dm: DynamicMedian!
    
    override func setUp() {
        super.setUp()
        dm = DynamicMedian()
    }
    
    override func tearDown() {
        super.tearDown()
        dm = nil
    }
    
    func test() {
        var a = [1,9,10,11,12,17,27,54,57,60,62,63]
        a.forEach { dm.enqueue ($0) }
        a.sort()
        
        for _ in 0..<a.count {
            let lowerMedianIndex = lowerMedian(a)
            XCTAssertEqual(dm.median(), median(a))
            XCTAssertEqual(dm.dequeue(), a[lowerMedianIndex])
            a.remove(at: lowerMedianIndex)
        }
    }
    
    func testRandom() {
        let tries = 100
        let maxSize = 20
        let maxNumber = 100

        for _ in 0...tries {
            let aSize = Int.random(in: 1...maxSize)
            var a = [Int]()

            for _ in 0..<aSize {
                a.append(Int.random(in: 0...maxNumber))
            }

            a.forEach { dm.enqueue($0) }
            a.sort()

            for _ in 0..<a.count {
                let lowerMedianIndex = lowerMedian(a)
                XCTAssertEqual(dm.median(), median(a))
                XCTAssertEqual(dm.dequeue(), a[lowerMedianIndex])
                a.remove(at: lowerMedianIndex)
            }
        }
    }
    
    private func median(_ a: [Int]) -> Double {
        if a.count.isMultiple(of: 2) {
            let lowerMedianIndex = lowerMedian(a)
            return Double(a[lowerMedianIndex] + a[lowerMedianIndex + 1]) / 2
        }
        else {
            return Double(a[a.count / 2])
        }
    }
    
    private func lowerMedian(_ a: [Int]) -> Int {
        return (a.count - 1) / 2
    }
    
}
