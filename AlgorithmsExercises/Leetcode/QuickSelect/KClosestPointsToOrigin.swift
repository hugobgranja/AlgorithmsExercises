//
//  KClosestPointsToOrigin.swift
//  AlgorithmsExercises
//
//  Created by hg on 30/05/2022.
//
//  Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane and an integer k, return the k closest points to the origin (0, 0).
//  The distance between two points on the X-Y plane is the Euclidean distance (i.e., √(x1 - x2)^2 + (y1 - y2)^2).
//  You may return the answer in any order. The answer is guaranteed to be unique (except for the order that it is in).
//

import Foundation

class KClosestPointsToOrigin {
    
    // Avg O(n) Worst case O(n^2) if worst pivot is chosen each time
    func solve(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        quickSelect(&points, k)
        return [[Int]](points.prefix(k))
    }
    
    private func quickSelect(_ a: inout [[Int]], _ k: Int) {
        a.shuffle()
        var low = 0, high = a.count - 1
        
        while high > low {
            let j = partition(&a, low, high)
            if j < k { low = j + 1 }
            else if j > k { high = j - 1 }
            else { return }
        }
    }
    
    private func partition(_ array: inout [[Int]], _ low: Int, _ high: Int) -> Int {
        var i = low
        var j = high + 1
        
        while true {
            repeat { i += 1 } while squaredDistance(array[i]) < squaredDistance(array[low]) && i != high
            repeat { j -= 1 } while squaredDistance(array[low]) < squaredDistance(array[j])
            if i >= j { break }
            array.swapAt(i, j)
        }
        
        array.swapAt(low, j)
        return j
    }
    
    private func squaredDistance(_ point: [Int]) -> Int {
        return point[0] * point[0] + point[1] * point[1]
    }
    
}
