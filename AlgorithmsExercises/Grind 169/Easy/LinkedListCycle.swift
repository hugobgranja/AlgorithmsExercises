//
//  LinkedListCycle.swift
//  AlgorithmsExercises
//  Created by hg on 26/05/2022.
//
//  |Linked List Cycle|
//  |Linked List|Two Pointers|Named Algorithm|
//  Given the head of a linked list, determine if the linked list has a cycle in it.
//

import Foundation

class LinkedListCycle {
    
    // O(1) memory - Floyd's Tortoise and Hare
    func solve(_ head: ListNode?) -> Bool {
        var slow = head?.next
        var fast = head?.next?.next
        
        while let someSlow = slow, let someFast = fast {
            if someSlow === someFast { return true }
            slow = someSlow.next
            fast = someFast.next?.next
        }
        
        return false
    }
    
    func solveAlt(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while let someSlow = slow, let someFast = fast?.next {
            slow = someSlow.next
            fast = someFast.next
            if someSlow === someFast { return true }
        }
        
        return false
    }
    
}
