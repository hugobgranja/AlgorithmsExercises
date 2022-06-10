//
//  MergeTwoSortedLinkedListsLT.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//
//  |Merge Two Sorted Lists|
//  |Linked List|Recursion|
//  You are given the heads of two sorted linked lists list1 and list2.
//  Merge the two lists in a one sorted list.
//  The list should be made by splicing together the nodes of the first two lists.
//  Return the head of the merged linked list.
//


import Foundation

class MergeTwoSortedLinkedListsLT {
    
    func solve(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let mergedRoot = ListNode()
        var f = list1
        var s = list2
        var m = mergedRoot
        
        while let someF = f, let someS = s {
            if someF.val <= someS.val {
                m.next = someF
                m = someF
                f = someF.next
            }
            else {
                m.next = someS
                m = someS
                s = someS.next
            }
        }
        
        m.next = f != nil ? f : s

        return mergedRoot.next
    }
    
    func solveRecursive(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = solveRecursive(list1.next, list2)
            return list1
        } else {
            list2.next = solveRecursive(list1, list2.next)
            return list2
        }
    }
    
}
