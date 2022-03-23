//
//  BSTInorderConstantSpaceTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 01/01/2021.
//

import XCTest
import SwiftAlgorithms

final class BSTInorderConstantSpaceTests: XCTestCase {
    
    var bstInorder: BSTInorderConstantSpace!
    var bst: BinarySearchTreeImpl<Int, String>!
    
    override func setUp() {
        super.setUp()
        bstInorder = BSTInorderConstantSpace()
        bst = BinarySearchTreeImpl()
    }
    
    override func tearDown() {
        super.tearDown()
        bstInorder = nil
        bst = nil
    }
    
    func test() {
        addTestData()
        
        let expectation = ["Zero","Two","Four","Five","Ten","Twelve"]
        
        var result = [String]()
        bstInorder.inorder(bst: bst) { result.append($0) }
        
        XCTAssertEqual(result, expectation)
    }
    
}

extension BSTInorderConstantSpaceTests {
    
    private func addTestData() {
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
    }
    
}
