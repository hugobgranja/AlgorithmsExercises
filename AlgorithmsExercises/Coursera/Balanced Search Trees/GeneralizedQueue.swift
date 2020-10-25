//
//  GeneralizedQueue.swift
//  AlgorithmsExercises
//
//  Created by hg on 21/02/2021.
//
//  Generalized queue.
//  Design a generalized queue data type that supports all of the following operations in logarithmic time (or better) in the worst case.
//
//  Create an empty data structure.
//  Append an item to the end of the queue.
//  Remove an item from the front of the queue.
//  Return the ith item in the queue.
//  Remove the ith item from the queue.
//

import Foundation
import SwiftAlgorithms

class GeneralizedQueue<T>: Queue {
    
    let tree: LLRBT<UInt, T>
    var enqueueKey: UInt
    
    init() {
        self.tree = LLRBT()
        self.enqueueKey = 0
    }
    
    func enqueue(_ element: T) {
        tree.put(key: enqueueKey, value: element)
        enqueueKey += 1
    }
    
    func dequeue() -> T? {
        let value = tree.min()?.value
        tree.deleteMin()
        return value
    }
    
    func peek() -> T? {
        return tree.min()?.value
    }
    
    func isEmpty() -> Bool {
        return tree.isEmpty()
    }
    
    func size() -> Int {
        return tree.size()
    }
    
    func select(index: Int) -> T? {
        return tree.select(rank: index)?.value
    }
    
    func remove(index: Int) {
        guard let key = tree.select(rank: index)?.key else { return }
        tree.delete(key: key)
    }
    
}
