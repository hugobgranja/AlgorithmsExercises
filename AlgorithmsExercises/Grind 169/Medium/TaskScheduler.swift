//
//  TaskScheduler.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//
//  |Task Scheduler|
//  |Priority Queue|Greedy|Counting|
//  Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order.
//  Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.
//  However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.
//  Return the least number of units of times that the CPU will take to finish all the given tasks.
//

import Foundation

class TaskScheduler {
    
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        let counts = tasks.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }.values
        var pq = PriorityQueue()
        var tasksOnCooldown = [(Int, Int)]()
        var time = 0
        
        for count in counts { pq.enqueue(count) }
        
        while !pq.isEmpty || !tasksOnCooldown.isEmpty {
            if var count = pq.dequeue() {
                count -= 1
                
                if count > 0 {
                    tasksOnCooldown.append((count, time + n))
                }
            }
            
            if let (count, readyAt) = tasksOnCooldown.first, readyAt == time {
                tasksOnCooldown.removeFirst()
                pq.enqueue(count)
            }
            
            time += 1
        }
        
        return time
    }
    
    // https://www.youtube.com/watch?v=Z2Plc8o1ld4
    func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Character: Int]()
        var maxFreq = 0
        var maxFreqCounts = 0
        
        for task in tasks {
            counts[task, default: 0] += 1
            if counts[task]! > maxFreq {
                maxFreq = counts[task]!
                maxFreqCounts = 1
            }
            else if counts[task] == maxFreq {
                maxFreqCounts += 1
            }
        }
        
        return max((maxFreq - 1) * (n + 1) + maxFreqCounts, tasks.count)
    }
    
}

extension TaskScheduler {
    
    struct PriorityQueue {
        
        private var heap = [Int]()
        
        var isEmpty: Bool {
            return heap.isEmpty
        }
        
        mutating func enqueue(_ element: Int) {
            heap.append(element)
            swim(heap.count - 1)
        }
        
        mutating func dequeue() -> Int? {
            let end = heap.count
            guard end > 0 else { return nil }
            
            let root = heap[0]
            heap.swapAt(0, end - 1)
            heap.removeLast()
            sink(0)
            
            return root
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
        
        private mutating func swim(_ k: Int) {
            var k = k
            var kparent = parent(k)
            
            while k > 0 && heap[kparent] < heap[k] {
                heap.swapAt(k, kparent)
                k = kparent
                kparent = parent(k)
            }
        }
        
        private mutating func sink(_ k: Int) {
            let end = heap.count
            var k = k, leftIndex = left(k)
            
            while leftIndex < end {
                let rightIndex = right(k)
                var swapIndex = leftIndex
                
                if rightIndex < end && heap[leftIndex] < heap[rightIndex] {
                    swapIndex = rightIndex
                }
                if heap[swapIndex] < heap[k] { break }
                heap.swapAt(k, swapIndex)
                
                k = swapIndex
                leftIndex = left(k)
            }
        }
        
    }
    
}
