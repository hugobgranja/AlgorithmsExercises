//
//  SmallestRangeCoveringElementsFromKLists.swift
//  AlgorithmsExercises
//  Created by hg on 09/07/2022.
//
//  |Smallest Range Covering Elementes from K Lists|
//  |Sliding Window|Binary Heap|
//  You have k lists of sorted integers in non-decreasing order. Find the smallest range that includes at least one number from each of the k lists.
//  We define the range [a, b] is smaller than range [c, d] if b - a < d - c or a < c if b - a == d - c.
//

import Foundation
import SwiftAlgorithms

class SmallestRangeCoveringElementsFromKLists {
    
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        typealias HeapElement = (row: Int, col: Int, num: Int)
        
        let minHeap = BinaryHeap<HeapElement> { $0.num > $1.num }
        var lowerBound = Int.max
        var upperBound = Int.min
        
        for (index, row) in nums.enumerated() {
            minHeap.enqueue((index, 0, row[0]))
            lowerBound = min(lowerBound, row[0])
            upperBound = max(upperBound, row[0])
        }
        
        var currentLow = lowerBound
        var currentUpper = upperBound
        
        while minHeap.count == nums.count, let (row, col, _) = minHeap.dequeue() {
            if col + 1 < nums[row].count {
                minHeap.enqueue((row, col + 1, nums[row][col + 1]))
                currentLow = minHeap.peek()!.num
                currentUpper = max(currentUpper, nums[row][col + 1])
            }
            
            if currentUpper - currentLow < upperBound - lowerBound {
                lowerBound = currentLow
                upperBound = currentUpper
            }
        }
        
        return [lowerBound, upperBound]
    }
    
}
