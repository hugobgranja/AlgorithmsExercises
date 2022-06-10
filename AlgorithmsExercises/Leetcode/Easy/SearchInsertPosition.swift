//
//  SearchInsertPosition.swift
//  AlgorithmsExercises
//  Created by hg on 16/06/2022.
//
//  |Search Insert Position|
//  |Binary Search|
//  Given a sorted array of distinct integers and a target value, return the index if the target is found.
//  If not, return the index where it would be if it were inserted in order.
//  You must write an algorithm with O(log n) runtime complexity.
//

import Foundation

class SearchInsertPosition {
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var lowerBound = 0
        var upperBound = nums.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            if target < nums[mid] { upperBound = mid - 1 }
            else if target > nums[mid] { lowerBound = mid + 1 }
            else { return mid }
        }
        
        return lowerBound
    }
    
}
