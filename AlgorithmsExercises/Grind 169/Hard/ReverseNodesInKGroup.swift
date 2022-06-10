//
//  ReverseNodesInKGroup.swift
//  AlgorithmsExercises
//  Created by hg on 09/07/2022.
//
//  |Reverse Nodes In k-Group|
//  |Linked List|
//  Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.
//  k is a positive integer and is less than or equal to the length of the linked list.
//  If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.
//  You may not alter the values in the list's nodes, only nodes themselves may be changed.
//

import Foundation

class ReverseNodesInKGroup {
    
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head, k > 1 else { return head }
        let length = length(head)
        let reverses = length / k
        
        let dummy = ListNode(0, head)
        var prev = dummy
        var current: ListNode? = head
        var i = 0
        
        while let someNode = current, i < reverses {
            let reversedNode = reverse(node: someNode, k: k)
            prev.next = reversedNode
            prev = someNode
            current = someNode.next
            i += 1
        }
        
        return dummy.next
    }
    
    private func length(_ node: ListNode?) -> Int {
        var node = node
        var count = 0
        
        while let someNode = node {
            count += 1
            node = someNode.next
        }
        
        return count
    }
    
    private func reverse(node: ListNode, k: Int) -> ListNode {
        var prev = node
        var current = node.next
        var i = 1
        
        prev.next = nil
        
        while let someNode = current, i < k {
            let temp = someNode.next
            someNode.next = prev
            prev = someNode
            current = temp
            i += 1
        }
        
        node.next = current
        
        return prev
    }
    
}
