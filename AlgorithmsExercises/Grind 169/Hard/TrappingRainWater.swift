//
//  TrappingRainWater.swift
//  AlgorithmsExercises
//  Created by hg on 25/06/2022.
//
//  |Trapping Rain Water|
//  |Array|Two Pointers|Dynamic Programming|Stack|
//  Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
//

import Foundation

class TrappingRainWater {
    
    // O(n) time, O(n) space
    func trap(_ height: [Int]) -> Int {
        var left = [Int]()
        var right = [Int]()
        
        for elevation in height {
            if let last = left.last { left.append(max(elevation, last)) }
            else { left.append(elevation) }
        }
        
        for elevation in height.reversed() {
            if let last = right.last { right.append(max(elevation, last)) }
            else { right.append(elevation) }
        }
        
        var trappedWater = 0
        for (index, reversedIndex) in zip(height.indices, height.indices.reversed()) {
            trappedWater += min(left[index], right[reversedIndex]) - height[index]
        }
        
        return trappedWater
    }
    
    // O(n) time, O(n) space
    func trap2(_ height: [Int]) -> Int {
        var stack = [Int]()
        var trappedWater = 0
        
        for (index, elevation) in height.enumerated() {
            while let top = stack.last, elevation > height[top] {
                stack.removeLast()
                if let nextTop = stack.last {
                    let distance = index - nextTop - 1
                    let boundedHeight = min(elevation, height[nextTop]) - height[top]
                    trappedWater += distance * boundedHeight
                }
            }
            
            stack.append(index)
        }
        
        return trappedWater
    }
    
    // O(n) time
    func trap3(_ height: [Int]) -> Int {
        guard height.count > 0 else { return 0 }
        var leftIndex = 0
        var rightIndex = height.endIndex - 1
        var maxLeftHeight = height[leftIndex]
        var maxRightHeight = height[rightIndex]
        var trappedWater = 0
        
        while leftIndex < rightIndex {
            if maxLeftHeight < maxRightHeight {
                trappedWater += maxLeftHeight - height[leftIndex]
                leftIndex += 1
                maxLeftHeight = max(maxLeftHeight, height[leftIndex])
            }
            else {
                trappedWater += maxRightHeight - height[rightIndex]
                rightIndex -= 1
                maxRightHeight = max(maxRightHeight, height[rightIndex])
            }
        }
        
        return trappedWater
    }
    
}
