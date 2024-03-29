//
//  LinkedListTests.swift
//  AlgorithmsExercisesTests
//  Created by hg on 16/02/2022.
//

import XCTest

class LinkedListTests: XCTestCase {
    
    var sut: LinkedList<Int>!
    
    override func setUp() {
        super.setUp()
        sut = LinkedList()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testAppend() {
        sut.append(1)
        XCTAssertEqual(sut.firstNode?.element, 1)
    }
    
    func testInitArray() {
        let array = [1,5,0]
        let sut = LinkedList<Int>(array: array)
        XCTAssertEqual(sut.asArray(), array)
    }
    
    func testAppendArray() {
        addTestData()
        sut.append([6,5,9])
        XCTAssertEqual(sut.asArray(), [1,5,0,6,5,9])
    }
    
    func testAppendLinkedList() {
        addTestData()
        let other = LinkedList<Int>()
        other.append([6,5,9])
        sut.append(other)
        XCTAssertEqual(sut.asArray(), [1,5,0,6,5,9])
    }
    
    func testAppendEmptyLinkedList() {
        addTestData()
        let other = LinkedList<Int>()
        sut.append(other)
        XCTAssertEqual(sut.asArray(), [1,5,0])
    }
    
    func testFirstNode() {
        sut.append(1)
        XCTAssertEqual(sut.firstNode?.element, 1)
        
        sut.append(2)
        XCTAssertEqual(sut.firstNode?.element, 1)
    }
    
    func testLastNode() {
        sut.append(1)
        XCTAssertEqual(sut.lastNode?.element, 1)
        
        sut.append(2)
        XCTAssertEqual(sut.lastNode?.element, 2)
    }
    
    func testIsEmpty() {
        XCTAssertTrue(sut.isEmpty())
        
        sut.append(1)
        XCTAssertFalse(sut.isEmpty())
    }
    
    func testMid() {
        addTestData()
        XCTAssertEqual(sut.mid()?.element, 5)
    }
    
    func testAsArray() {
        addTestData()
        XCTAssertEqual(sut.asArray(), [1,5,0])
    }
    
    func testAsArrayWhenEmpty() {
        XCTAssertEqual(sut.asArray(), [])
    }
    
}

extension LinkedListTests {
    
    private func addTestData() {
        sut.append(1)
        sut.append(5)
        sut.append(0)
    }
    
}
