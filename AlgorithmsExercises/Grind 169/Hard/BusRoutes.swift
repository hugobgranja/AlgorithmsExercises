//
//  BusRoutes.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//
//  |Bus Routes|
//  |Array|Hash Table|BFS|
//  You are given an array routes representing bus routes where routes[i] is a bus route that the ith bus repeats forever.
//  For example, if routes[0] = [1, 5, 7], this means that the 0th bus travels in the sequence 1 -> 5 -> 7 -> 1 -> 5 -> 7 -> 1 -> ... forever.
//  You will start at the bus stop source (You are not on any bus initially), and you want to go to the bus stop target.
//  You can travel between bus stops by buses only.
//  Return the least number of buses you must take to travel from source to target.
//  Return -1 if it is not possible.
//

import Foundation
import SwiftAlgorithms

class BusRoutes {
    
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
        if source == target { return 0 }
        var routeBuses = [Int: [Int]]()
        
        for (bus, stops) in routes.enumerated() {
            for stop in stops {
                routeBuses[stop, default: []].append(bus)
            }
        }
        
        if routeBuses[source] == nil || routeBuses[target] == nil {
            return -1
        }
        
        let queue = TwoStackQueue<Int>()
        let targetBuses = Set(routeBuses[target, default: []])
        var visited = Set<Int>()
        var busesUsed = 1
    
        for bus in routeBuses[source, default: []] {
            queue.enqueue(bus)
            visited.insert(bus)
        }
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let currentBus = queue.dequeue()!
                
                if targetBuses.contains(currentBus) {
                    return busesUsed
                }
                
                for stop in routes[currentBus] {
                    for nextBus in routeBuses[stop, default: []] {
                        if !visited.contains(nextBus) {
                            queue.enqueue(nextBus)
                            visited.insert(nextBus)
                        }
                    }
                }
            }
            
            busesUsed += 1
        }
        
        return -1
    }
    
}
