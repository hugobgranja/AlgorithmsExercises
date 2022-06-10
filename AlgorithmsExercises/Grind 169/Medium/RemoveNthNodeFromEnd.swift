//
//  RemoveNthNodeFromEnd.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Remove Nth Node From End of List|
//  |Linked List|Two Pointers|
//  Given the head of a linked list, remove the nth node from the end of the list and return its head.
//

import Foundation

class RemoveNthNodeFromEnd {
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0, head)
        var left = dummy
        var right = head
        var count = 0
        
        while let someNode = right, count < n {
            right = someNode.next
            count += 1
        }
        
        guard count == n else { return head }
        
        while let someRight = right {
            left = left.next!
            right = someRight.next
        }
        
        left.next = left.next?.next
        
        return dummy.next
    }
    
}
