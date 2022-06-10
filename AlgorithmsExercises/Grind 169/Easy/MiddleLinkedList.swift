//
//  MiddleLinkedList.swift
//  AlgorithmsExercises
//  Created by hg on 27/05/2022.
//
//  |Middle of the Linked List|
//  |Linked List|Two Pointers|
//  Given the head of a singly linked list, return the middle node of the linked list.
//  If there are two middle nodes, return the second middle node.
//

import Foundation

class MiddleLinkedList {
    
    func solve(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        
        while let someSlow = slow?.next, let someFast = fast?.next {
            slow = someSlow
            fast = someFast.next
        }
        
        return slow
    }
    
}
