//
//  LargestRectangleInHistogram.swift
//  AlgorithmsExercises
//  Created by hg on 29/06/2022.
//
//  |Largest Rectangle in Histogram|
//  |Array|Monotonic Stack|
//  Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.
//

import Foundation

class LargestRectangleInHistogram {
    
    // Naive - TLE - For any rectangle check if it can be extended to the left or right
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var largest = 0
        
        for (index, currentHeight) in heights.enumerated() {
            var low = index
            var high = index
            
            while low > 0 && heights[low - 1] >= currentHeight {
                low -= 1
            }
            
            while high < heights.endIndex - 1 && heights[high + 1] >= currentHeight {
                high += 1
            }
            
            let area = (high - low + 1) * currentHeight
            largest = max(largest, area)
        }
        
        return largest
    }
    
    // Monotonic stack
    // If the top of the stack has higher height than current it can't be extended to the right anymore
    // When removing from stack keep track of possible starts for current
    func largestRectangleArea2(_ heights: [Int]) -> Int {
        typealias Rectangle = (index: Int, height: Int)
        var stack = [Rectangle]()
        var largest = 0
        
        for (index, height) in heights.enumerated() {
            var lastGTEIndex = index
            
            while let (lastIndex, lastHeight) = stack.last, lastHeight >= height {
                stack.removeLast()
                let lastArea = (index - lastIndex) * lastHeight
                largest = max(largest, lastArea)
                lastGTEIndex = lastIndex
            }
            
            stack.append((lastGTEIndex, height))
        }
        
        while let (lastIndex, lastHeight) = stack.popLast() {
            let lastArea = (heights.count - lastIndex) * lastHeight
            largest = max(largest, lastArea)
        }
        
        return largest
    }
    
}
