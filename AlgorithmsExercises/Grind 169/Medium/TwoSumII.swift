//
//  TwoSumII.swift
//  AlgorithmsExercises
//  Created by hg on 30/05/2022.
//
//  |Two Sum II - Input Array Is Sorted|
//  |Array|Two Pointers|Binary Search|
//  Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number.
//  Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 <= numbers.length.
//  Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.
//  The tests are generated such that there is exactly one solution.
//  You may not use the same element twice.
//  Your solution must use only constant extra space.
//


import Foundation

class TwoSumII {
    
    func solve(_ numbers: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = numbers.count - 1
        
        while left < right {
            let sum = numbers[left] + numbers[right]
            if sum > target { right -= 1 }
            else if sum < target { left += 1 }
            else { return [left + 1, right + 1] }
        }
    
        return []
    }
    
}
