//
//  MinStack.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/05/2022.
//
//  Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
//

import Foundation

class MinStack {
    
    private var stack: [Int]
    private var minStack: [Int]
    
    init() {
        self.stack = [Int]()
        self.minStack = [Int]()
    }

    func push(_ val: Int) {
        stack.append(val)
        
        if let currentMin = minStack.last {
            let newMin = min(val, currentMin)
            minStack.append(newMin)
        }
        else {
            minStack.append(val)
        }
    }

    func pop() {
        stack.removeLast()
        minStack.removeLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
    
}
