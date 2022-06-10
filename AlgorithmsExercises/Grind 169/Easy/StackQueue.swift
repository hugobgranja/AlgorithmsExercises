//
//  StackQueue.swift
//  AlgorithmsExercises
//  Created by hg on 26/05/2022.
//
//  |Implement Queue Using Stacks|
//  |Stack|Queue|Data Structure|
//

import Foundation

class StackQueue {
    
    private var pushStack: [Int]
    private var popStack: [Int]
    
    init() {
        pushStack = [Int]()
        popStack = [Int]()
    }
    
    func push(_ x: Int) {
        pushStack.append(x)
    }
    
    func pop() -> Int {
        if popStack.isEmpty { movePushToPop() }
        return popStack.popLast()!
    }
    
    func peek() -> Int {
        if popStack.isEmpty { movePushToPop() }
        return popStack.last!
    }
    
    func empty() -> Bool {
        return pushStack.isEmpty && popStack.isEmpty
    }
    
    private func movePushToPop() {
        while let element = pushStack.popLast() {
            popStack.append(element)
        }
    }
    
}
