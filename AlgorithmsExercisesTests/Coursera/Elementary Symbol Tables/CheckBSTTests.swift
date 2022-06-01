//
//  CheckBSTTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 01/01/2021.
//

import XCTest
import SwiftAlgorithms

final class CheckBSTTests: XCTestCase {
    
    var checkBST: CheckBST!
    var bst: BinarySearchTreeImpl<Int, String>!
    
    override func setUp() {
        super.setUp()
        checkBST = CheckBST()
        bst = BinarySearchTreeImpl()
    }
    
    override func tearDown() {
        super.tearDown()
        checkBST = nil
        bst = nil
    }
    
    func testValid() {
        addTestData()
        XCTAssertTrue(checkBST.isBST(bst))
    }
    
    func testInvalidLeft() {
        addTestData()
        bst.root?.left?.left?.key = 3
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testInvalidLeftRightMax() {
        addTestData()
        bst.root?.left?.right?.key = 6
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testInvalidLeftRightMin() {
        addTestData()
        bst.root?.left?.right?.key = 1
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testInvalidRightLeftMin() {
        addTestData()
        bst.root?.right?.left?.key = 4
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testInvalidRightLeftMax() {
        addTestData()
        bst.root?.right?.left?.key = 11
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testInvalidRightRight() {
        addTestData()
        bst.root?.right?.right?.key = 9
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testRepeatedLeft() {
        addTestData()
        bst.root?.left?.key = 5
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testRepeatedRight() {
        addTestData()
        bst.root?.right?.key = 5
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
}

extension CheckBSTTests {
    
    private func addTestData() {
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        bst.put(key: 6, value: "Six")
    }
    
}
