//
//  MaximumFrequencyStack.swift
//  AlgorithmsExercises
//  Created by hg on 03/07/2022.
//
//  |Maximum Frequency Stack|
//  |Hash Table|Stack|Data Structure|
//  Design a stack-like data structure to push elements to the stack and pop the most frequent element from the stack.
//  Implement the FreqStack class:
//  FreqStack() constructs an empty frequency stack.
//  void push(int val) pushes an integer val onto the top of the stack.
//  int pop() removes and returns the most frequent element in the stack.
//  If there is a tie for the most frequent element, the element closest to the stack's top is removed and returned.
//

import Foundation

class MaximumFrequencyStack {
    
    private var maxFrequency: Int
    private var feqCount: [Int: Int]
    private var feqStack: [Int: [Int]]

    init() {
        self.maxFrequency = 0
        self.feqCount = [:]
        self.feqStack = [:]
    }

    func push(_ val: Int) {
        let count = feqCount[val, default: 0] + 1
        feqCount[val, default: 0] = count
        feqStack[count, default: []].append(val)
        if count > maxFrequency { maxFrequency = count }
    }

    func pop() -> Int {
        let val = feqStack[maxFrequency]!.popLast()!
        
        feqCount[val]! -= 1
        if feqCount[val]! == 0 { feqCount[val] = nil }
        
        if feqStack[maxFrequency]!.isEmpty {
            feqStack[maxFrequency] = nil
            maxFrequency -= 1
        }
        
        return val
    }
    
}
