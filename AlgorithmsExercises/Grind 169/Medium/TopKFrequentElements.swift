//
//  TopKFrequentElements.swift
//  AlgorithmsExercises
//  Created by hg on 11/06/2022.
//
//  |Top K Frequent Elements|
//  |Hash Table|Counting|Bucket Sort|
//  Given an integer array nums and an integer k, return the k most frequent elements.
//  You may return the answer in any order.
//

import Foundation

class TopKFrequentElements {
    
    // O(n) time, O(n) space
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let count = nums.reduce(into: [Int: Int]()) { $0[$1, default: 0] += 1 }
        var frequency = [[Int]](repeating: [], count: nums.count + 1)
        
        for (key, value) in count {
            frequency[value].append(key)
        }
        
        var result = [Int]()
        for values in frequency.reversed() {
            for value in values {
                result.append(value)
                if result.count == k { return result }
            }
        }
        
        return result
    }
    
}
