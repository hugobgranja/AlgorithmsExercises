//
//  MergeIntervals.swift
//  AlgorithmsExercises
//  Created by hg on 03/06/2022.
//
//  |Merge Intervals|
//  |Sorting|Intervals|
//  Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
//

import Foundation

class MergeIntervals {
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        
        for interval in sorted {
            if let last = result.last, last[1] >= interval[0] {
                result[result.count - 1][1] = max(interval[1], last[1])
            }
            else {
                result.append(interval)
            }
        }
        
        return result
    }
    
}
