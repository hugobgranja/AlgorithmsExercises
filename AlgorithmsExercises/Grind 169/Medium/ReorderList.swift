//
//  ReorderList.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Reorder List|
//  |Linked List|
//  You are given the head of a singly linked-list.
//  The list can be represented as:
//  L0 → L1 → … → Ln - 1 → Ln
//  Reorder the list to be on the following form:
//  L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
//  You may not modify the values in the list's nodes.
//

import Foundation

class ReorderList {
    
    func reorderList(_ head: ListNode?) {
        guard let someHead = head else { return }
        let mid = findMid(someHead)
        var left = head
        var right = mid.next.map { reverse($0) }
        mid.next = nil
        
        while let someLeft = left, let someRight = right {
            left = someLeft.next
            someLeft.next = someRight
            right = someRight.next
            someRight.next = left
        }
    }
    
    private func findMid(_ head: ListNode) -> ListNode {
        var slow = head
        var fast = head.next
        
        while let someFast = fast?.next {
            slow = slow.next!
            fast = someFast.next
        }
        
        return slow
    }
    
    private func reverse(_ node: ListNode) -> ListNode {
        var prev = node
        var current = node.next
        
        prev.next = nil
        
        while let someNode = current {
            let temp = someNode.next
            someNode.next = prev
            prev = someNode
            current = temp
        }
        
        return prev
    }
    
}
