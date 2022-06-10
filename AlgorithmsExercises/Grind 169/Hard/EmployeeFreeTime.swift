//
//  EmployeeFreeTime.swift
//  AlgorithmsExercises
//  Created by hg on 06/07/2022.
//
//  |Employee Free Time|
//  |Array|Sorting|Intervals|
//  We are given a list schedule of employees, which represents the working time for each employee.
//  Each employee has a list of non-overlapping Intervals, and these intervals are in sorted order.
//  Return the list of finite intervals representing common, positive-length free time for all employees, also in sorted order.
//

import Foundation

class EmployeeFreeTime {
    
    class Interval {
        var start: Int
        var end: Int
        init() { start = 0; end = 0 }
        init(_ a: Int, _ b: Int) { start = a; end = b }
    }
    
    // Merge overlapping intervals and then find free time
    func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
        let intervals = schedule.flatMap { $0 }
        let merged = merge(intervals)
        var result = [Interval]()
        
        for (first, second)  in zip(merged, merged.dropFirst()) {
            if first.end < second.start {
                let newInterval = Interval(first.end, second.start)
                result.append(newInterval)
            }
        }
        
        return result
    }
    
    private func merge(_ intervals: [Interval]) -> [Interval] {
        let sorted = intervals.sorted { $0.start < $1.start }
        var result = [Interval]()
        
        for interval in sorted {
            if let last = result.last, last.end >= interval.start {
                result[result.count - 1].end = max(interval.end, last.end)
            }
            else {
                result.append(interval)
            }
        }
        
        return result
    }
    
    func employeeFreeTime2(_ schedule: [[Interval]]) -> [Interval] {
        let intervals = schedule.flatMap { $0 }
        let sorted = intervals.sorted { $0.start < $1.start }
        var result = [Interval]()
        var prevEnd = intervals[0].end
        
        for interval in sorted.dropFirst() {
            if prevEnd < interval.start {
                result.append(Interval(prevEnd, interval.start))
            }
            
            prevEnd = max(prevEnd, interval.end)
        }
        
        return result
    }
    
}
