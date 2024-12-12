//
//  LinkedList.swift
//  AlgorithmsExercises
//  Created by hg on 01/11/2020.
//
//  Some exercises require manipulating the internals of Linked lists.
//  For this reason I use this class instead of the Linked List from the SwiftAlgorithms package.
//

import Foundation

class LinkedList<T> {
    
    class Node<E> {
        var element: E
        var next: Node<E>?

        init(_ element: E, next: Node<E>?) {
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
    
    func prepend(_ element: T) {
        let node = Node(element, next: firstNode)
        firstNode = node
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
    
    func append(_ linkedList: LinkedList<T>) {
        guard !linkedList.isEmpty() else { return }
        
        if isEmpty() {
            firstNode = linkedList.firstNode
            lastNode = linkedList.lastNode
        }
        else {
            lastNode?.next = linkedList.firstNode
            lastNode = linkedList.lastNode
        }
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
    
    func asArray() -> [T] {
        var it = firstNode
        var array = [T]()
        
        while let someIt = it {
            array.append(someIt.element)
            it = someIt.next
        }
        
        return array
    }
    
}
