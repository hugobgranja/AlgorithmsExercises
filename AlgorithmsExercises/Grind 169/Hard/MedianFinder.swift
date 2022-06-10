//
//  MedianFinder.swift
//  AlgorithmsExercises
//  Created by hg on 25/06/2022.
//
//  |Find Median From Data Stream|
//  |Priority Queue|Data Stream|Data Structure|
//  The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value and the median is the mean of the two middle values.
//  For example, for arr = [2,3,4], the median is 3.
//  For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
//  Implement the MedianFinder class:
//  MedianFinder() initializes the MedianFinder object.
//  void addNum(int num) adds the integer num from the data stream to the data structure.
//  double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
//

import Foundation

class MedianFinder {
    
    private let maxHeap: PriorityQueue<Int>
    private let minHeap: PriorityQueue<Int>
    
    init() {
        self.maxHeap = PriorityQueue { $0 < $1 }
        self.minHeap = PriorityQueue { $0 > $1 }
    }
    
    var count: Int {
        maxHeap.count + minHeap.count
    }
    
    func addNum(_ num: Int) {
        if let median = maxHeap.peek() {
            if num < median { maxHeap.enqueue(num) }
            else { minHeap.enqueue(num) }
        }
        else {
            maxHeap.enqueue(num)
        }
        
        heapify()
    }
    
    func findMedian() -> Double {
        if count.isMultiple(of: 2) {
            return Double(maxHeap.peek()! + minHeap.peek()!) / 2
        }
        else {
            return Double(maxHeap.peek()!)
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

extension MedianFinder {
    
    class PriorityQueue<T> {
        
        private let isLowerPriority: (T, T) -> Bool
        private var elements: [T]
        
        init(isLowerPriority: @escaping (T,T) -> Bool) {
            self.elements = [T]()
            self.isLowerPriority = isLowerPriority
        }
        
        var count: Int { elements.count }
        
        func peek() -> T? {
            return elements.first
        }
        
        func enqueue(_ element: T) {
            elements.append(element)
            swim(elements.count - 1)
        }
        
        func dequeue() -> T? {
            guard count > 0 else { return nil }
            
            let root = elements[0]
            elements.swapAt(0, count - 1)
            elements.removeLast()
            sink(0)
            
            return root
        }
        
        func isEmpty() -> Bool {
            return elements.isEmpty
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
            
            while k > 0 && isLowerPriority(elements[kparent], elements[k]) {
                elements.swapAt(k, kparent)
                k = kparent
                kparent = parent(k)
            }
        }
        
        private func sink(_ k: Int) {
            var k = k, leftIndex = left(k)
            
            while leftIndex < count {
                let rightIndex = right(k)
                var swapIndex = leftIndex
                
                if rightIndex < count && isLowerPriority(elements[leftIndex], elements[rightIndex]) {
                    swapIndex = rightIndex
                }
                
                if isLowerPriority(elements[swapIndex], elements[k]) { break }
                elements.swapAt(k, swapIndex)
                
                k = swapIndex
                leftIndex = left(k)
            }
        }
    }
    
}
