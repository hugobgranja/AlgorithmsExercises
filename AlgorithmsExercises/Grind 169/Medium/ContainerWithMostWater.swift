//
//  ContainerWithMostWater.swift
//  AlgorithmsExercises
//  Created by hg on 07/06/2022.
//
//  |Container With Most Water|
//  |Two Pointers|Greedy|
//  You are given an integer array height of length n.
//  There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
//  Find two lines that together with the x-axis form a container, such that the container contains the most water.
//  Return the maximum amount of water a container can store.
//  Notice that you may not slant the container.
//

import Foundation

class ContainerWithMostWater {
    
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = 0
        var leftIndex = 0
        var rightIndex = height.count - 1
        
        while leftIndex < rightIndex {
            let minHeight = min(height[leftIndex], height[rightIndex])
            let area = minHeight * (rightIndex - leftIndex)
            maxArea = max(maxArea, area)
            
            if height[leftIndex] < height[rightIndex] {
                leftIndex += 1
            }
            else {
                rightIndex -= 1
            }
        }
        
        return maxArea
    }
    
}
