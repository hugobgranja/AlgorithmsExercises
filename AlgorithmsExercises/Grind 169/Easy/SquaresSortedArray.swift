//
//  SquaresSortedArray.swift
//  AlgorithmsExercises
//  Created by hg on 29/05/2022.
//
//  |Squares of a Sorted Array|
//  |Array|Two Pointers|
//  Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
//

import Foundation

class SquaresSortedArray {
    
    func solve(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var index = 0
        var negativeCount = 0
        
        while index < nums.endIndex {
            var nextNum = nums[index]
            index += 1
            
            if nextNum < 0 {
                negativeCount += 1
            }
            else {
                if negativeCount > 0 {
                    let negativeNum = abs(nums[negativeCount - 1])
                    
                    if negativeNum <= nextNum {
                        nextNum = negativeNum
                        negativeCount -= 1
                        index -= 1
                    }
                }
                
                result.append(nextNum * nextNum)
            }
        }
        
        while negativeCount > 0 {
            let num = nums[negativeCount - 1]
            result.append(num * num)
            negativeCount -= 1
        }
        
        return result
    }
    
    func solve2(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        var low = 0
        var high = nums.endIndex - 1
        
        while low <= high {
            if abs(nums[low]) > abs(nums[high]) {
                result.append(nums[low] * nums[low])
                low += 1
            }
            else {
                result.append(nums[high] * nums[high])
                high -= 1
            }
        }
        
        return result.reversed()
    }
    
}
