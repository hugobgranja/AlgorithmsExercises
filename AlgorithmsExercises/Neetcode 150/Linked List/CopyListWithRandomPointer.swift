//
//  CopyListWithRandomPointer.swift
//  AlgorithmsExercises
//  Created by hg on 11/07/2022.
//
//  |Copy List With Random Pointer|
//  |Linked List|Hash Table|
//  A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.
//  Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node.
//  Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.
//  For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.
//  Return the head of the copied linked list.
//  The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:
//  val: an integer representing Node.val
//  random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
//  Your code will only be given the head of the original linked list.
//

import Foundation

class CopyListWithRandomPointer {
    
    class Node {
        var val: Int
        var next: Node?
        var random: Node?
        
        init(_ val: Int) {
            self.val = val
            self.next = nil
            self.random = nil
        }
    }
    
    func copyRandomList(_ head: Node?) -> Node? {
        var oldToCopyMap = [Node: Node]()
        var node = head
        
        while let someNode = node {
            let copy = Node(someNode.val)
            oldToCopyMap[someNode] = copy
            node = someNode.next
        }
        
        node = head
        while let someNode = node {
            let copy = oldToCopyMap[someNode]!
            copy.next = someNode.next.flatMap { oldToCopyMap[$0] }
            copy.random = someNode.random.flatMap { oldToCopyMap[$0] }
            node = someNode.next
        }
        
        return head.flatMap { oldToCopyMap[$0] }
    }
    
}

extension CopyListWithRandomPointer.Node: Hashable {
    
    static func == (lhs: CopyListWithRandomPointer.Node, rhs: CopyListWithRandomPointer.Node) -> Bool {
        return lhs === rhs
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
}