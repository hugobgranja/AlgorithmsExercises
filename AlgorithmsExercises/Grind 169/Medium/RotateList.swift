//
//  RotateList.swift
//  AlgorithmsExercises
//  Created by hg on 22/06/2022.
//
//  |Rotate List|
//  |Linked List|Two Pointers|
//  Given the head of a linked list, rotate the list to the right by k places.
//

import Foundation

class RotateList {
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else { return head }
        var k = k
        var first = head
        var second = head
        var i = 1
        
        while i <= k {
            if let next = second.next {
                second = next
                i += 1
            }
            else {
                k = k % i
                second = head
                i = 1
            }
        }
        
        while let next = second.next {
            first = first.next!
            second = next
        }
        
        guard first !== second else { return head }
        
        let newHead = first.next
        second.next = head
        first.next = nil
        
        return newHead
    }
    
    func rorateRight2(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head, head.next != nil, k > 0 else { return head }
        var tail = head
        var length = 1
        
        while let next = tail.next {
            tail = next
            length += 1
        }
        
        tail.next = head
        
        let t = length - (k % length)
        for _ in 0..<t { tail = tail.next! }
        let newHead = tail.next
        tail.next = nil
        return newHead
    }
    
}
