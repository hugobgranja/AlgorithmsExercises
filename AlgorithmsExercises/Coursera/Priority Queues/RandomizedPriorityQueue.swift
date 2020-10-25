//
//  RandomizedPriorityQueue.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/12/2020.
//
//  Randomized priority queue.
//  Describe how to add the methods sample() and delRandom() to our binary heap implementation.
//  The two methods return a key that is chosen uniformly at random among the remaining keys, with the latter method also removing that key.
//  The sample() method should take constant time; the delRandom() method should take logarithmic time.
//  Do not worry about resizing the underlying array.
//

import Foundation
import SwiftAlgorithms

class RandomizedPriorityQueue<T>: PriorityQueue where T: Comparable {
    
    private var heap: [T]
    private let isLowerPriority: (T, T) -> Bool
    
    init(isLowerPriority: @escaping (T,T) -> Bool) {
        self.heap = [T]()
        self.isLowerPriority = isLowerPriority
    }
    
    func enqueue(_ element: T) {
        heap.append(element)
        swim(heap.count - 1)
    }
    
    func dequeue() -> T? {
        let end = size()
        guard end > 0 else { return nil }
        
        let max = heap[0]
        heap.swapAt(0, end - 1)
        heap.removeLast()
        sink(0)
        
        return max
    }
    
    func peek() -> T? {
        return heap.first
    }
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
    func size() -> Int {
        return heap.count
    }
    
    func sample() -> T? {
        return heap.randomElement()
    }
    
    func dequeueRandom() -> T? {
        let end = size()
        guard end > 0 else { return nil }
        
        let randomIndex = Int.random(in: 0..<size())
        let element = heap[randomIndex]
        heap.swapAt(randomIndex, end - 1)
        heap.removeLast()
        heapifyDQRandom(randomIndex)
        
        return element
    }
    
    private func parent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func left(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func right(_ index: Int) -> Int {
        return 2 * index + 2
    }
    
    private func swim(_ k: Int) {
        var k = k
        var kparent = parent(k)
        
        while k > 0 && isLowerPriority(heap[kparent], heap[k]) {
            heap.swapAt(k, kparent)
            k = kparent
            kparent = parent(k)
        }
    }
    
    private func sink(_ k: Int) {
        let end = size()
        var k = k, leftIndex = left(k)
        
        while leftIndex < end {
            let rightIndex = right(k)
            var swapIndex = leftIndex
            
            if rightIndex < end && isLowerPriority(heap[leftIndex], heap[rightIndex]) { swapIndex = rightIndex }
            if isLowerPriority(heap[swapIndex], heap[k]) { break }
            heap.swapAt(k, swapIndex)
            
            k = swapIndex
            leftIndex = left(k)
        }
    }
    
    private func heapifyDQRandom(_ k: Int) {
        guard k < size() else { return }
        if isLowerPriority(heap[parent(k)], heap[k]) { swim(k) }
        else { sink(k) }
    }
    
}
