//
//  MergeKSortedLists.swift
//  AlgorithmsExercises
//  Created by hg on 29/06/2022.
//
//  |Merge K Sorted Lists|
//  |Linked List|Divide and Conquer|Priority Queue|Merge Sort|
//  You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.
//  Merge all the linked-lists into one sorted linked-list and return it.
//

import Foundation
import SwiftAlgorithms

class MergeKSortedLists {
    
    // Merge in groups of two - O(kN) where k = lists.count
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        var head = lists[0]
        
        for list in lists.dropFirst() {
            head = merge(head, list)
        }
        
        return head
    }
    
    // Divide and Conquer - O(n log k) time
    func mergeKLists2(_ lists: inout [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else { return nil }
        var interval = 1
        
        while interval < lists.count {
            for index in stride(from: 0, to: lists.count - interval, by: interval * 2) {
                lists[index] = merge(lists[index], lists[index + interval])
            }
            
            interval *= 2
        }
        
        return lists[0]
    }
    
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHeadNode = ListNode()
        var firstNode = l1
        var secondNode = l2
        var currentNode = dummyHeadNode
        
        while let someFirst = firstNode, let someSecond = secondNode {
            if someFirst.val <= someSecond.val {
                currentNode.next = someFirst
                currentNode = someFirst
                firstNode = someFirst.next
            }
            else {
                currentNode.next = someSecond
                currentNode = someSecond
                secondNode = someSecond.next
            }
        }
        
        currentNode.next = firstNode != nil ? firstNode : secondNode
        return dummyHeadNode.next
    }
    
    // Priority Queue - O(n log k) time, O(k) space.
    func mergeKLists3(_ lists: [ListNode?]) -> ListNode? {
        let dummyHead = ListNode()
        let pq = BinaryHeap<ListNode> { $0.val > $1.val }
        
        for list in lists {
            if let list = list {
                pq.enqueue(list)
            }
        }
        
        var currentNode = dummyHead
        while let node = pq.dequeue() {
            currentNode.next = node
            if let nextNode = node.next { pq.enqueue(nextNode) }
            node.next = nil
            currentNode = node
        }
        
        return dummyHead.next
    }
    
}
