//
//  MeetingRoomsII.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Meeting Rooms II|
//  |Greedy|Sorting|
//  Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.
//

import Foundation

class MeetingRoomsII {
    
    class Interval {
        var start: Int
        var end: Int
        init() { start = 0; end = 0 }
        init(_ a: Int, _ b: Int) { start = a; end = b }
    }
    
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        let starts = intervals.map { $0.start }.sorted()
        let ends = intervals.map { $0.end }.sorted()
        var roomCount = 0
        var j = 0
        
        for i in intervals.indices {
            if starts[i] < ends[j] {
                roomCount += 1
            }
            else {
                j += 1
            }
        }
        
        return roomCount
    }
    
}
