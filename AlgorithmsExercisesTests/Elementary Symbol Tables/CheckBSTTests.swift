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
    
    override func setUp() {
        super.setUp()
        checkBST = CheckBST()
    }
    
    override func tearDown() {
        super.tearDown()
        checkBST = nil
    }
    
    func testTrue() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        XCTAssertTrue(checkBST.isBST(bst))
    }
    
    func testFalseLeft() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        
        bst.root?.left?.left?.key = 3
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testFalseLeftRightMax() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        
        bst.root?.left?.right?.key = 6
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testFalseLeftRightMin() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        
        bst.root?.left?.right?.key = 1
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testFalseRightLeftMin() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        bst.put(key: 6, value: "Six")
        
        bst.root?.right?.left?.key = 4
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testFalseRightLeftMax() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        bst.put(key: 6, value: "Six")
        
        bst.root?.right?.left?.key = 11
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
    func testFalseRightRight() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        bst.put(key: 6, value: "Six")
        
        bst.root?.right?.right?.key = 9
        XCTAssertFalse(checkBST.isBST(bst))
    }
    
}
