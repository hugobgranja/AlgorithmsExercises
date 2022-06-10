//
//  NonOverlappingIntervals.swift
//  AlgorithmsExercises
//  Created by hg on 24/06/2022.
//
//  |Non Overlapping Intervals|
//  |Array|Dynamic Programming|Greedy|Sorting|Intervals|
//  Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.
//

import Foundation

class NonOverlappingIntervals {
    
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
        var erased = 0
        var prevEnd = Int.min
        
        for interval in sortedIntervals {
            let start = interval[0]
            let end = interval[1]
            
            if start >= prevEnd {
                prevEnd = end
            }
            else {
                erased += 1
                prevEnd = min(end, prevEnd)
            }
        }
        
        return erased
    }
    
    func eraseOverlapIntervalsEnd(_ intervals: [[Int]]) -> Int {
        let sortedIntervals = intervals.sorted { $0[1] < $1[1] }
        var erased = 0
        var currentEnd = Int.min
        
        for interval in sortedIntervals {
            if interval[0] >= currentEnd {
                currentEnd = interval[1]
            }
            else {
                erased += 1
            }
        }
        
        return erased
    }
    
}
