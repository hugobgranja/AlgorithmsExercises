//
//  LinkedList.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/11/2020.
//

import Foundation

class LinkedList<T> {
    
    class Node<T> {
        var element: T
        var next: Node<T>?
        
        init(_ element: T, next: Node<T>?) {
            self.element = element
            self.next = next
        }
    }

    var firstNode: Node<T>?
    var lastNode: Node<T>?
    
    init() {}
    
    init(node: Node<T>) {
        append(node)
    }
    
    init(array: [T]) {
        append(array)
    }
    
    func append(_ element: T) {
        let node = Node(element, next: nil)
        append(node)
    }
    
    func append(_ node: Node<T>) {
        let oldLast = lastNode
        lastNode = node
        if isEmpty() { firstNode = lastNode }
        else { oldLast?.next = lastNode }
    }
    
    func append(_ array: [T]) {
        array.forEach { append($0) }
    }
    
    func isEmpty() -> Bool {
        return firstNode == nil
    }
    
    func mid() -> Node<T>? {
        if isEmpty() { return firstNode }
        var slow = firstNode, fast = firstNode
        
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
    
}
