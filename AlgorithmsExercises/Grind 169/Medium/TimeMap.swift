//
//  TimeMap.swift
//  AlgorithmsExercises
//  Created by hg on 04/06/2022.
//
//  |Time Based Key-Value Store|
//  |Hash Table|Binary Search|Data Structure|
//  Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.
//
//  Implement the TimeMap class:
//  TimeMap() Initializes the object of the data structure.
//  void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
//  String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp. If there are multiple such values, it returns the value associated with the largest timestamp_prev.
//  If there are no values, it returns "".
//

import Foundation

class TimeMap {
    
    private typealias TimedValue = (timestamp: Int, value: String)
    private var map: [String: [TimedValue]]
    
    init() {
        self.map = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: []].append((timestamp, value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        return map[key].flatMap({ binarySearch($0, timestamp) }) ?? ""
    }
    
    private func binarySearch(_ array: [TimedValue], _ timestamp: Int) -> String? {
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            
            if timestamp < array[mid].timestamp {
                upperBound = mid - 1
            } else if timestamp > array[mid].timestamp {
                lowerBound = mid + 1
            } else {
                return array[mid].value
            }
        }
        
        if array.indices.contains(upperBound) {
            return array[upperBound].value
        }
        
        return nil
    }
    
}
