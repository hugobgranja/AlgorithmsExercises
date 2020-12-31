//
//  MergeSortLinkedList.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/10/2020.
//

import Foundation

class MergeSortLinkedList {

    func sort<T: Comparable>(_ l: LinkedList<T>) {
        if l.firstNode?.next == nil { return }
        
        let mid = l.mid()
        let midNext = mid?.next
        mid?.next = nil
        
        let left = LinkedList(node: l.firstNode!)
        let right = LinkedList(node: midNext!)
        sort(left)
        sort(right)
        l.firstNode = merge(left, right).firstNode
    }
    
    private func merge<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
        let merged = LinkedList<T>()
        var leftNode = left.firstNode
        var rightNode = right.firstNode
        
        while true {
            if leftNode == nil, let valuedNode = rightNode {
                merged.append(valuedNode)
                break
            }
            else if rightNode == nil, let valuedNode = leftNode {
                merged.append(valuedNode)
                break
            }
            else if leftNode!.element < rightNode!.element {
                merged.append(leftNode!)
                leftNode = leftNode!.next
            }
            else {
                merged.append(rightNode!)
                rightNode = rightNode!.next
            }
        }
        
        return merged
    }
    
}
