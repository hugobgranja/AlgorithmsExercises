//
//  RemoveKFromList.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/04/2022.
//
//  Given a singly linked list of integers l and an integer k, remove all elements from list l that have a value equal to k.
//  Note: Solve this task in O(n) time using O(1) additional space, where n is the number of elements in the list.
//

import Foundation

class RemoveKFromList {
    
    func solve(list: LinkedList<Int>, k: Int) {
        let tempNode = LinkedList<Int>.Node<Int>(0, next: list.firstNode)
        var prev = tempNode
        var node = list.firstNode
        
        while let someNode = node {
            if someNode.element == k { prev.next = someNode.next }
            else { prev = someNode }
            node = someNode.next
        }
        
        list.firstNode = tempNode.next
    }
    
}
