//
//  MergeTwoLinkedLists.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/05/2022.
//
//  Given two singly linked lists sorted in non-decreasing order, your task is to merge them.
//  In other words, return a singly linked list, also sorted in non-decreasing order, that contains the elements from both original lists.
//  Your solution should have O(l1.length + l2.length) time complexity.
//

import Foundation

class MergeTwoLinkedLists {
    
    func solve(l1: LinkedList<Int>, l2: LinkedList<Int>) -> LinkedList<Int> {
        let merged = LinkedList<Int>()
        var i = l1.firstNode
        var j = l2.firstNode
        
        while let someI = i, let someJ = j {
            if someI.element <= someJ.element {
                merged.append(someI.element)
                i = someI.next
            }
            else {
                merged.append(someJ.element)
                j = someJ.next
            }
        }
        
        var remaining = i != nil ? i : j
        while let someRemaining = remaining {
            merged.append(someRemaining.element)
            remaining = someRemaining.next
        }
        
        return merged
    }
    
}
