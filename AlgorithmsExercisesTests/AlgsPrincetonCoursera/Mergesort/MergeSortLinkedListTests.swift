//
//  MergeSortLinkedList.swift
//  AlgorithmsExercisesTests
//  Created by hg on 04/11/2020.
//

import XCTest

final class MergeSortLinkedListTests: XCTestCase {
    
    var sort: MergeSortLinkedList!
    
    override func setUp() {
        super.setUp()
        sort = MergeSortLinkedList()
    }
    
    override func tearDown() {
        super.tearDown()
        sort = nil
    }
    
    func testSortEmpty() {
        let linkedList = LinkedList<Int>()
        sort.sort(linkedList)
        XCTAssertTrue(isSorted(linkedList))
    }
    
    func testSort() {
        let linkedList = LinkedList(
            array: [1,6,78,8,2392832,423,42,34,13405,1101,1,123,4,6980,193,4,2,5,6,8,9]
        )
        
        sort.sort(linkedList)
        XCTAssertTrue(isSorted(linkedList))
    }
    
    func testIsSortedEmpty() {
        let linkedList = LinkedList<Int>()
        XCTAssertTrue(isSorted(linkedList))
    }
    
    func testIsSorted() {
        let sortedLL = LinkedList(array: [1,2,3,4,5,6,7,8,9,10,123,124,1023,1567,1892,9876])
        XCTAssertTrue(isSorted(sortedLL))
        
        let unsortedLL = LinkedList(array: [1,2,9,4,5,6,7,8,9,10,11,12,1001,1002,5])
        XCTAssertFalse(isSorted(unsortedLL))
    }
    
    private func isSorted<T: Comparable>(_ linkedList: LinkedList<T>) -> Bool {
        guard var node = linkedList.firstNode else { return true }
        while let next = node.next {
            if next.element < node.element { return false }
            node = next
        }
        return true
    }

}
