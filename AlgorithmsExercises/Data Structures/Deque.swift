//
//  Deque.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//

import Foundation

struct Deque<T> {
    
    private let capacity: Int
    private var ring: [T?]
    private var start: Int
    private var end: Int
    var count: Int
    
    init(capacity: Int) {
        self.capacity = capacity
        self.ring = [T?](repeating: nil, count: capacity)
        self.start = 0
        self.end = 0
        self.count = 0
    }
    
    var isEmpty: Bool { count == 0 }
    
    var first: T? {
        guard !isEmpty else { return nil }
        return ring[start]
    }
    
    var last: T? {
        guard !isEmpty else { return nil }
        let lastIndex = end == 0 ? capacity - 1 : end - 1
        return ring[lastIndex]
    }
    
    mutating func append(_ element: T) {
        guard count < capacity else { return }
        ring[end] = element
        end = (end + 1) % capacity
        count += 1
    }
    
    mutating func prepend(_ element: T) {
        guard count < capacity else { return }
        start -= 1
        if start < 0 { start = capacity - 1 }
        ring[start] = element
        count += 1
    }
    
    @discardableResult
    mutating func popFirst() -> T? {
        guard !isEmpty else { return nil }
        let first = ring[start]
        count -= 1
        start += 1
        if start == capacity { start = 0 }
        return first
    }
    
    @discardableResult
    mutating func popLast() -> T? {
        guard !isEmpty else { return nil }
        count -= 1
        end -= 1
        if end < 0 { end = capacity  - 1 }
        return ring[end]
    }
    
}
