//
//  InsertInterval.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/05/2022.
//
//  You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti.
//  You are also given an interval newInterval = [start, end] that represents the start and end of another interval.
//  Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).
//  Return intervals after the insertion.
//

import Foundation

class InsertInterval {
    
    // Can merge if interval[0] <= newInterval[1] && interval[1] >= newInterval[0]
    func solve(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var newInterval = newInterval
        
        for (index, interval) in intervals.enumerated() {
            if interval[1] < newInterval[0] {
                result.append(interval)
            }
            else if interval[0] > newInterval[1] {
                result.append(newInterval)
                return result + intervals.suffix(from: index)
            }
            else {
                let start = min(interval[0], newInterval[0])
                let end = max(interval[1], newInterval[1])
                newInterval = [start, end]
            }
        }
        
        result.append(newInterval)
        
        return result
    }
    
}
