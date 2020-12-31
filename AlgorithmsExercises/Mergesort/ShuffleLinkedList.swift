//
//  ShuffleLinkedList.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/11/2020.
//
//  Shuffling a linked list.
//  Given a singly-linked list containing nn items, rearrange the items uniformly at random.
//  Your algorithm should consume a logarithmic (or constant) amount of extra memory and run in time proportional to nlogn in the worst case.
//

import Foundation

class ShuffleLinkedList {
    
    func shuffle<T: Comparable>(_ l: LinkedList<T>) {
        if l.firstNode?.next == nil { return }
        
        let mid = l.mid()
        let midNext = mid?.next
        mid?.next = nil
        
        let left = LinkedList(node: l.firstNode!)
        let right = LinkedList(node: midNext!)
        shuffle(left)
        shuffle(right)
        l.firstNode = shuffleMerge(left, right).firstNode
    }
    
    private func shuffleMerge<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
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
            else if Bool.random() {
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
