//
//  GeneralizedQueueTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 21/02/2021.
//

import XCTest

final class GeneralizedQueueTests: XCTestCase {
    
    var queue: GeneralizedQueue<Int>!
    
    override func setUp() {
        super.setUp()
        queue = GeneralizedQueue()
    }
    
    override func tearDown() {
        super.tearDown()
        queue = nil
    }
    
    func testPopEmpty() {
        let element = queue.dequeue()
        XCTAssertNil(element)
    }
    
    func testEnqueueDequeue() {
        queue.enqueue(2)
        queue.enqueue(1)
        var element = queue.dequeue()
        XCTAssertEqual(element, 2)
        element = queue.dequeue()
        XCTAssertEqual(element, 1)
    }
    
    func testPeek() {
        XCTAssertNil(queue.peek())
        queue.enqueue(2)
        XCTAssertEqual(queue.peek(), 2)
        queue.enqueue(3)
        XCTAssertEqual(queue.peek(), 2)
    }
    
    func testIsEmpty() {
        XCTAssertTrue(queue.isEmpty())
        queue.enqueue(1)
        XCTAssertFalse(queue.isEmpty())
        _ = queue.dequeue()
        XCTAssertTrue(queue.isEmpty())
    }
    
    func testSize() {
        XCTAssertEqual(queue.size(), 0)
        queue.enqueue(1)
        XCTAssertEqual(queue.size(), 1)
        queue.enqueue(2)
        XCTAssertEqual(queue.size(), 2)
        _ = queue.dequeue()
        XCTAssertEqual(queue.size(), 1)
        _ = queue.dequeue()
        XCTAssertEqual(queue.size(), 0)
    }
    
    func testSelect() {
        queue.enqueue(5)
        queue.enqueue(2)
        queue.enqueue(10)
        queue.enqueue(4)
        queue.enqueue(12)
        queue.enqueue(0)
        
        let ordered = [5,2,10,4,12,0]
        
        for (index, element) in ordered.enumerated() {
            let value = queue.select(rank: index)
            XCTAssertEqual(value, element)
        }
    }
    
    func testRemove() {
        queue.enqueue(5)
        queue.enqueue(2)
        queue.enqueue(10)
        queue.enqueue(4)
        queue.enqueue(12)
        queue.enqueue(0)
        queue.remove(rank: 4)
        
        let ordered = [5,2,10,4,0]
        for (index, element) in ordered.enumerated() {
            let value = queue.select(rank: index)
            XCTAssertEqual(value, element)
        }
    }
    
}
