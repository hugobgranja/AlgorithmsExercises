//
//  TopKFrequentWords.swift
//  AlgorithmsExercises
//  Created by hg on 11/06/2022.
//
//  |Top K Frequent Words|
//  |Hash Table|Counting|Priority Queue|Bucket Sort|
//  Given an array of strings words and an integer k, return the k most frequent strings.
//  Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.
//

import Foundation

class TopKFrequentWords {
    
    // O(n log k) time, O(n) space
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        typealias WordFrequencyPair = (word: String, frequency: Int)
        
        let counts = words.reduce(into: [String: Int]()) { $0[$1, default: 0] += 1 }
        let pq = PriorityQueue<WordFrequencyPair> {
            ($0.frequency == $1.frequency && $0.word < $1.word) || $0.frequency > $1.frequency
        }
        
        for (word, frequency) in counts {
            pq.enqueue((word, frequency))
            
            if pq.count > k {
                pq.dequeue()
            }
        }
        
        var result = [String]()
        while let element = pq.dequeue() {
            result.append(element.word)
        }
        
        return result.reversed()
    }
    
    func topKFrequent2(_ words: [String], _ k: Int) -> [String] {
        let counts = words.reduce(into: [String: Int]()) { $0[$1, default: 0] += 1 }
        var frequency = [[String]](repeating: [], count: words.count + 1)
        
        for (key, value) in counts {
            frequency[value].append(key)
        }
        
        var result = [String]()
        for values in frequency.reversed() {
            for value in values.sorted() {
                result.append(value)
                if result.count == k { return result }
            }
        }
        
        return result
    }
    
}

extension TopKFrequentWords {
    
    class PriorityQueue<T> {
        private let isLowerPriority: (T, T) -> Bool
        private var elements: [T]
        
        init(isLowerPriority: @escaping (T,T) -> Bool) {
            self.elements = [T]()
            self.isLowerPriority = isLowerPriority
        }
        
        var count: Int { elements.count }
        
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
