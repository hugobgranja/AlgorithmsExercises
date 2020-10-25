//
//  LinkedListPartition.swift
//  AlgorithmsExercises
//
//  Created by hg on 16/02/2022.
//
//  Partition: Write code to partition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x.
//  If x is contained within the list, the values of x only need to be after the elements less than x.
//  The partition element x can appear anywhere in the "right partition"; it does not need to appear between the left and right partitions.
//

import Foundation

class LinkedListPartition {
    
    // Unstable
    func partition<T: Comparable>(linkedList: LinkedList<T>, k: T) {
        var head = linkedList.firstNode
        var tail = linkedList.firstNode
        var it = linkedList.firstNode
        
        while let someIt = it {
            let next = someIt.next
            
            if someIt.element < k {
                someIt.next = head
                head = someIt
            }
            else {
                tail?.next = someIt
                tail = someIt
            }
            
            it = next
        }
        
        tail?.next = nil
        linkedList.firstNode = head
        linkedList.lastNode = tail
    }
    
    // Stable and groups elements equal to k
    func partitionV2<T: Comparable>(linkedList: LinkedList<T>, k: T) -> LinkedList<T> {
        let lt = LinkedList<T>()
        let eq = LinkedList<T>()
        let gt = LinkedList<T>()
        
        var it = linkedList.firstNode
        
        while let someIt = it {
            let next = someIt.next
            someIt.next = nil
            
            if someIt.element < k {
                lt.append(someIt)
            }
            else if someIt.element == k {
                eq.append(someIt)
            }
            else {
                gt.append(someIt)
            }
            
            it = next
        }
        
        lt.append(eq)
        lt.append(gt)
        
        return lt
    }
    
}
