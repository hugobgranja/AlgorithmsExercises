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
    
    override func setUp() {
        super.setUp()
        bstInorder = BSTInorderConstantSpace()
    }
    
    override func tearDown() {
        super.tearDown()
        bstInorder = nil
    }
    
    func test() {
        let bst = BinarySearchTreeImpl<Int, String>()
        bst.put(key: 5, value: "Five")
        bst.put(key: 2, value: "Two")
        bst.put(key: 10, value: "Ten")
        bst.put(key: 4, value: "Four")
        bst.put(key: 12, value: "Twelve")
        bst.put(key: 0, value: "Zero")
        
        let ordered = ["Zero","Two","Four","Five","Ten","Twelve"]
        var i = 0
        
        bstInorder.inorder(bst: bst) {
            XCTAssertEqual($0, ordered[i])
            i += 1
        }
    }
    
}
