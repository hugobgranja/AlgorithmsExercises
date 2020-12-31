//
//  StackMax.swift
//  AlgorithmsExercises
//
//  Created by hg on 12/10/2020.
//
//  Stack with max.
//  Create a data structure that efficiently supports the stack operations (push and pop) and also return-the-maximum operation.
//  Assume the elements are real numbers so that you can compare them.
//

import Foundation
import SwiftAlgorithms

class StackMax<T: Comparable> {
    
    private var stack: ArrayStack<T>
    private var maxStack: ArrayStack<T>
    
    init() {
        stack = ArrayStack<T>()
        maxStack = ArrayStack<T>()
    }
    
    func push(_ element: T) {
        stack.push(element)
        
        if let currentMax = maxStack.peek() {
            let newMax = max(element, currentMax)
            maxStack.push(newMax)
        }
        else {
            maxStack.push(element)
        }
    }
    
    func pop() -> T? {
        _ = maxStack.pop()
        return stack.pop()
    }
    
    func peek() -> T? {
        return stack.peek()
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty()
    }
    
    func size() -> Int {
        return stack.size()
    }
    
    func maximum() -> T? {
        return maxStack.peek()
    }
    
}
