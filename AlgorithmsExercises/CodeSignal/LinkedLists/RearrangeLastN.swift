//
//  RearrangeLastN.swift
//  AlgorithmsExercises
//
//  Created by hg on 02/05/2022.
//
//  Given a singly linked list of integers l and a non-negative integer n, move the last n list nodes to the beginning of the linked list.
//  Solve this task in O(list size) time using O(1) additional space.
//


import Foundation

class RearrangeLastN {
    
    func solve(l: LinkedList<Int>, n: Int) {
        var before = l.firstNode
        var after = l.firstNode
        var i = 0
        
        while let someAfter = after, i < n {
            after = someAfter.next
            i += 1
        }
        
        if after == nil { return }
        
        while let someBefore = before, let afterNext = after?.next {
            before = someBefore.next
            after = afterNext
        }
        
        after?.next = l.firstNode
        l.firstNode = before?.next
        before?.next = nil
        l.lastNode = before
    }

}
