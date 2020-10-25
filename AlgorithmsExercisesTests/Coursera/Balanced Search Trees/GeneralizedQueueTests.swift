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
    
    func testEnqueue() {
        queue.enqueue(1)
        XCTAssertEqual(queue.size(), 1)
    }
    
    func testDequeue() {
        XCTAssertNil(queue.dequeue())
        
        queue.enqueue(1)
        XCTAssertEqual(queue.dequeue(), 1)
    }
    
    func testPeek() {
        XCTAssertNil(queue.peek())
        
        queue.enqueue(2)
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
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.size(), 0)
        
        queue.enqueue(1)
        XCTAssertEqual(queue.size(), 1)
        
        queue.enqueue(2)
        XCTAssertEqual(queue.size(), 2)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.size(), 1)
    }
    
    func testSelect() {
        addTestValues()
        
        let expectation = [5,2,10,4,12,0]
        
        for (index, element) in expectation.enumerated() {
            let value = queue.select(index: index)
            XCTAssertEqual(value, element)
        }
    }
    
    func testRemove() {
        addTestValues()
        
        let expectation = [5,2,10,4,0]
        
        queue.remove(index: 4)
        
        var result = [Int]()
        while let element = queue.dequeue() { result.append(element) }
        XCTAssertEqual(result,expectation)
    }
    
}

extension GeneralizedQueueTests {
    
    private func addTestValues() {
        queue.enqueue(5)
        queue.enqueue(2)
        queue.enqueue(10)
        queue.enqueue(4)
        queue.enqueue(12)
        queue.enqueue(0)
    }
    
}
