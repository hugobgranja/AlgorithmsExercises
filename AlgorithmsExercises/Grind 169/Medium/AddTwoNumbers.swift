//
//  AddTwoNumbers.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Add Two Numbers|
//  |Linked List|Math|
//  You are given two non-empty linked lists representing two non-negative integers.
//  The digits are stored in reverse order, and each of their nodes contains a single digit.
//  Add the two numbers and return the sum as a linked list.
//  You may assume the two numbers do not contain any leading zero, except the number 0 itself.
//

import Foundation

class AddTwoNumbers {
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHeadNode = ListNode()
        var l1 = l1, l2 = l2
        var currentNode = dummyHeadNode
        var carry = 0
        
        while l1 != nil || l2 != nil || carry > 0 {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum > 9 ? 1 : 0
            
            let newNode = ListNode(sum % 10)
            currentNode.next = newNode
            currentNode = newNode
            
            l1 = l1?.next
            l2 = l2?.next
        }
        
        return dummyHeadNode.next
    }
    
}
