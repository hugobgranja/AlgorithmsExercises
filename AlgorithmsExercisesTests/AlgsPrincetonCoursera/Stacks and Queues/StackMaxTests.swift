//
//  StackMaxTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 12/10/2020.
//

import XCTest

final class StackMaxTests: XCTestCase {

    var stack: StackMax<Int>!
    
    override func setUp() {
        super.setUp()
        stack = StackMax<Int>()
    }

    override func tearDown() {
        super.tearDown()
        stack = nil
    }
    
    func testPush() {
        stack.push(1)
        XCTAssertEqual(stack.size(), 1)
    }
    
    func testPop() {
        XCTAssertNil(stack.pop())
        
        stack.push(1)
        XCTAssertEqual(stack.pop(), 1)
    }
    
    func testPeek() {
        XCTAssertNil(stack.peek())
        
        stack.push(2)
        XCTAssertEqual(stack.peek(), 2)
    }
    
    func testIsEmpty() {
        XCTAssertTrue(stack.isEmpty())
        
        stack.push(1)
        XCTAssertFalse(stack.isEmpty())
        
        _ = stack.pop()
        XCTAssertTrue(stack.isEmpty())
    }
    
    func testSize() {
        XCTAssertEqual(stack.size(), 0)
        
        _ = stack.pop()
        XCTAssertEqual(stack.size(), 0)
        
        stack.push(1)
        XCTAssertEqual(stack.size(), 1)
        
        stack.push(2)
        XCTAssertEqual(stack.size(), 2)
        
        _ = stack.pop()
        XCTAssertEqual(stack.size(), 1)
    }
    
    func testMax() {
        XCTAssertNil(stack.maximum())
        
        stack.push(2)
        XCTAssertEqual(stack.maximum(), 2)
        
        stack.push(3)
        XCTAssertEqual(stack.maximum(), 3)
        
        stack.push(1)
        XCTAssertEqual(stack.maximum(), 3)
        
        _ = stack.pop()
        XCTAssertEqual(stack.maximum(), 3)
        
        _ = stack.pop()
        XCTAssertEqual(stack.maximum(), 2)
        
        _ = stack.pop()
        XCTAssertNil(stack.maximum())
    }

}
