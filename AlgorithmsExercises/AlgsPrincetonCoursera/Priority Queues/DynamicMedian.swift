//
//  DynamicMedian.swift
//  AlgorithmsExercises
//  Created by hg on 26/12/2020.
//
//  Dynamic median.
//  Design a data type that supports insert in logarithmic time, find-the-median in constant time, and remove-the-median in logarithmic time.
//  If the number of keys in the data type is even, find/remove the lower median.
//

import Foundation
import SwiftAlgorithms

class DynamicMedian {
    
    private let maxHeap: MaxBinaryHeap<Int>
    private let minHeap: MinBinaryHeap<Int>
    
    init() {
        self.maxHeap = MaxBinaryHeap<Int>()
        self.minHeap = MinBinaryHeap<Int>()
    }
    
    func enqueue(_ element: Int) {
        if let median = maxHeap.peek() {
            if element < median { maxHeap.enqueue(element) }
            else { minHeap.enqueue(element) }
        }
        else {
            maxHeap.enqueue(element)
        }
        
        heapify()
    }
    
    func dequeue() -> Int? {
        let lowerMedian = maxHeap.dequeue()
        heapify()
        return lowerMedian
    }
    
    func peek() -> Int? {
        return maxHeap.peek()
    }
    
    func isEmpty() -> Bool {
        return maxHeap.isEmpty()
    }
    
    func size() -> Int {
        return maxHeap.count + minHeap.count
    }
    
    func median() -> Double? {
        guard size() > 0 else { return nil }
        
        if size().isMultiple(of: 2) {
            return Double(maxHeap.peek()! + minHeap.peek()!) / 2
        }
        else {
            return Double(peek()!)
        }
    }
    
    private func heapify() {
        if maxHeap.count > minHeap.count + 1 {
            minHeap.enqueue(maxHeap.dequeue()!)
        }
        
        if minHeap.count > maxHeap.count {
            maxHeap.enqueue(minHeap.dequeue()!)
        }
    }
    
}

extension DynamicMedian: CustomStringConvertible {
    
    var description: String {
        return "\(maxHeap) \(minHeap)"
    }
    
}
