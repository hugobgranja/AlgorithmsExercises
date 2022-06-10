//
//  CheapestFlightsDijkstra.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Cheapest Flights Within K Stops|
//  |Graph|Shortest Path|Dijkstra SP|
//  There are n cities connected by some number of flights.
//  You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is a flight from city fromi to city toi with cost pricei.
//  You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.
//

import Foundation

class CheapestFlightsDijkstra {

    struct Path {
        let stop: Int
        let cost: Int
        let stops: Int
    }
    
    struct Edge {
        let destination: Int
        let cost: Int
    }
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        let adjacencyList = buildAdjacencyList(n, flights)
        let queue = PriorityQueue<Path> { $0.cost > $1.cost }
        var costTo = [Int](repeating: Int.max, count: n)
        var stopsTo = [Int](repeating: Int.max, count: n)
        costTo[src] = 0
        stopsTo[src] = 0
        queue.enqueue(Path(stop: src, cost: 0, stops: 0))

        while let path = queue.dequeue() {
            if path.stop == dst {
                return path.cost
            }
            
            if path.stops == k + 1 {
                continue
            }
            
            for edge in adjacencyList[path.stop] {
                let nextCost = path.cost + edge.cost
                let nextStops = path.stops + 1
                
                if costTo[edge.destination] > nextCost || stopsTo[edge.destination] > nextStops {
                    costTo[edge.destination] = nextCost
                    stopsTo[edge.destination] = nextStops
                    let newPath = Path(stop: edge.destination, cost: nextCost, stops: nextStops)
                    queue.enqueue(newPath)
                }
            }
        }

        return -1
    }
    
    private func buildAdjacencyList(_ vertexCount: Int, _ flights: [[Int]]) -> [[Edge]] {
        var adjacencyList = [[Edge]](repeating: [], count: vertexCount)
        
        for flight in flights {
            let edge = Edge(destination: flight[1], cost: flight[2])
            adjacencyList[flight[0]].append(edge)
        }
        
        return adjacencyList
    }
    
}

extension CheapestFlightsDijkstra {
    
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
