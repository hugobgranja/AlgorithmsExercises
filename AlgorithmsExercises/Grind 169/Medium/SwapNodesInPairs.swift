//
//  SwapNodesInPairs.swift
//  AlgorithmsExercises
//  Created by hg on 12/06/2022.
//
//  |Swap Nodes in Pairs|
//  |Linked List|
//  Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)
//

import Foundation

class SwapNodesInPairs {
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0, head)
        var prev = dummy
        var node = head
        
        while let someNode = node, let nextNode = someNode.next {
            someNode.next = nextNode.next
            prev.next = nextNode
            nextNode.next = someNode
            
            prev = someNode
            node = someNode.next
        }
        
        return dummy.next
    }
    
}
