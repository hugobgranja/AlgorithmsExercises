//
//  LinkedListPartitionTests.swift
//  AlgorithmsExercisesTests
//
//  Created by hg on 16/02/2022.
//

import XCTest

final class LinkedListPartitionTests: XCTestCase {

    var sut: LinkedListPartition!
    
    override func setUp() {
        super.setUp()
        sut = LinkedListPartition()
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testPartitionV1() {
        let linkedList = LinkedList<Int>(array: [4,3,8,9,5,6,1,2,9,0,5])
        let k = 5
        
        sut.partition(linkedList: linkedList, k: k)
        
        XCTAssertTrue(isPartitioned(array: linkedList.asArray(), k: k))
    }
    
    func testPartitionV2() {
        let linkedList = LinkedList<Int>(array: [4,3,8,9,5,6,1,2,9,0,5])
        let k = 5
        
        let result = sut.partitionV2(linkedList: linkedList, k: k).asArray()
        
        print(result)
        
        XCTAssertTrue(isPartitioned(array: result, k: k))
    }
    
    func testIsPartitionedWhenTrue() {
        let array = [3,4,1,0,2,5,9,8,6,7]
        XCTAssertTrue(isPartitioned(array: array, k: 5))
    }
    
    func testIsPartitionedWhenFalse() {
        let array = [3,4,1,0,2,5,9,8,6,4,7]
        XCTAssertFalse(isPartitioned(array: array, k: 5))
    }
    
    func testIsPartitionedWhenAllLess() {
        let array = [2,5,6,7,8,2,3,4,5]
        XCTAssertTrue(isPartitioned(array: array, k: 9))
    }
    
    func testIsPartitionedWhenAllGreater() {
        let array = [5,6,7,8,9,7,6,8,8,6,5]
        XCTAssertTrue(isPartitioned(array: array, k: 5))
    }
    
    private func isPartitioned<T: Comparable>(array: [T], k: T) -> Bool {
        var reachedTippingPoint = false
        
        for element in array {
            if reachedTippingPoint {
                if element < k { return false }
            }
            else {
                reachedTippingPoint = element >= k
            }
        }
        
        return true
    }

}
