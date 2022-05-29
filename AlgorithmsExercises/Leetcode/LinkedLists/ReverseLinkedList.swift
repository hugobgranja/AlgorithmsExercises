//
//  ReverseLinkedList.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/05/2022.
//
//  Given the head of a singly linked list, reverse the list, and return the reversed list.
//

import Foundation

class ReverseLinkedList {
    
    func solve(_ head: ListNode?) -> ListNode? {
        var prev = head
        var current = head?.next
        
        prev?.next = nil
        
        while let someCurrent = current {
            let temp = someCurrent.next
            someCurrent.next = prev
            prev = someCurrent
            current = temp
        }
        
        return prev
    }
    
}
