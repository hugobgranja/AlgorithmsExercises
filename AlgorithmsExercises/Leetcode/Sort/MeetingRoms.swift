//
//  MeetingRoms.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Given an array of meeting time intervals consisting of start and end times [[s1, e1], [s2,e2],...] (si < e1), determine if a person could attend all meetings.
//


import Foundation

class MeetingRooms {
    
    class Interval {
        var start: Int
        var end: Int
        init() { start = 0; end = 0; }
        init(_ a: Int, _ b: Int) { start = a; end = b }
    }
    
    func solve(_ intervals: [Interval]) -> Bool {
        let sortedIntervals = intervals.sorted { $0.start < $1.start }
        
        for index in sortedIntervals.indices.dropFirst() {
            if sortedIntervals[index].start < sortedIntervals[index - 1].end {
                return false
            }
        }
        
        return true
    }
    
}
