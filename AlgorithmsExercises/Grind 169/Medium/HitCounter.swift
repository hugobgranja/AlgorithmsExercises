//
//  HitCounter.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Design Hit Counter|
//  |Data Structure|
//  Design a hit counter which counts the number of hits received in the past 5 minutes.
//  Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing).
//  You may assume that the earliest timestamp starts at 1.
//  It is possible that several hits arrive roughly at the same time.
//

import Foundation

class HitCounter {
    
    private var timestamps: [Int]
    private var hits: [Int]
    
    init() {
        self.timestamps = [Int](repeating: 0, count: 300) // 5 min = 300 secs
        self.hits = [Int](repeating: 0, count: 300)
    }
    
    func hit(_ timestamp: Int) {
        let index = timestamp % 300
        
        if timestamps[index] == timestamp {
            hits[index] += 1
        }
        else {
            timestamps[index] = timestamp
            hits[index] = 1
        }
    }
    
    func getHits(_ timestamp: Int) -> Int {
        var hitCount = 0
        
        for index in 0..<300 {
            if timestamp - timestamps[index] < 300 {
                hitCount += hits[index]
            }
        }
        
        return hitCount
    }
    
}
