//
//  KthLargestElementInStream.swift
//  AlgorithmsExercises
//  Created by hg on 25/06/2022.
//
//  |Kth Largest Element in a Stream|
//  |Priority Queue|Data Stream|Data Structure|
//  Design a class to find the kth largest element in a stream.
//  Note that it is the kth largest element in the sorted order, not the kth distinct element.
//  Implement KthLargest class:
//  KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
//  int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.
//

import Foundation

class KthLargestElementInStream {
    
    private let k: Int
    private let pq: PriorityQueue<Int>
    
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.pq = PriorityQueue { $0 > $1 }
        for num in nums { add(num) }
    }

    @discardableResult
    func add(_ val: Int) -> Int {
        pq.enqueue(val)
        if pq.count > k { pq.dequeue() }
        return pq.peek()!
    }
    
}

extension KthLargestElementInStream {
    
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
        
        @discardableResult
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
