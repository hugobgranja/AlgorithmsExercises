//
//  SlidingWindowMaximum.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//
//  |Sliding Window Maximum|
//  |Sliding Window|Monotonic Queue|Deque|
//  You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right.
//  You can only see the k numbers in the window.
//  Each time the sliding window moves right by one position.
//  Return the max sliding window.
//

import Foundation
import SwiftAlgorithms

class SlidingWindowMaximum {
    
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var deque = Deque<Int>(capacity: k)
        var result = [Int]()
        
        for (index, num) in nums.enumerated() {
            if index >= k && nums[index - k] == deque.first {
                deque.popFirst()
            }
            
            while let last = deque.last, num > last {
                deque.popLast()
            }
            
            deque.append(num)
            
            if index >= k - 1 { result.append(deque.first!) }
        }
        
        return result
    }
    
}
