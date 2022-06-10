//
//  OddEvenLinkedList.swift
//  AlgorithmsExercises
//  Created by hg on 13/06/2022.
//
//  |Odd Even Linked List|
//  |Linked List|
//  Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.
//  The first node is considered odd, and the second node is even, and so on.
//  Note that the relative order inside both the even and odd groups should remain as it was in the input.
//  You must solve the problem in O(1) extra space complexity and O(n) time complexity.
//

import Foundation

class OddEvenLinkedList {
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        let evenHead = head.next
        var oddNode = head
        var evenNode = head.next
        
        while let someEvenNode = evenNode {
            oddNode.next = someEvenNode.next
            
            if let nextOddNode = someEvenNode.next {
                oddNode = nextOddNode
            }
            
            evenNode?.next = oddNode.next
            evenNode = oddNode.next
        }
        
        oddNode.next = evenHead
        return head
    }
    
}
