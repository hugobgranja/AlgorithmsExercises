//
//  RandomizedPriorityQueueTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 27/12/2020.
//

import XCTest

final class RandomizedPriorityQueueTests: XCTestCase {
    
    var pq: RandomizedPriorityQueue<Int>!
    
    override func setUp() {
        super.setUp()
        pq = RandomizedPriorityQueue<Int>(isLowerPriority: { $0 < $1 })
    }
    
    override func tearDown() {
        super.tearDown()
        pq = nil
    }
    
    func test() {
        var a = [1,9,10,11,12,17,27,54,57,60,62,63]
        a.forEach { pq.enqueue ($0) }
        a.sort()
        
        let element = pq.dequeueRandom()!
        a.remove(at: a.firstIndex(of: element)!)
        
        let asorted = a.sorted { $0 > $1 }
        for element in asorted {
            XCTAssertEqual(pq.dequeue(), element)
        }
    }
    
}
