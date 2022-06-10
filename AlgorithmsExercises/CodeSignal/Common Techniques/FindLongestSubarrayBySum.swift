//
//  FindLongestSubarrayBySum.swift
//  AlgorithmsExercises
//  Created by hg on 22/05/2022.
//
//  You have an unsorted array arr of non-negative integers and a number s.
//  Find a longest contiguous subarray in arr that has a sum equal to s.
//  Return two integers that represent its inclusive bounds.
//  If there are several possible answers, return the one with the smallest left bound.
//  If there are no answers, return [-1].
//  Your answer should be 1-based, meaning that the first position of the array is 1 instead of 0.
//

import Foundation

class FindLongestSubarrayBySum {
    
    func solve(s: Int, arr: [Int]) -> [Int] {
        var maxRange: ClosedRange<Int>?
        var maxLength = -1
        var lowerBound = 0
        var upperBound = 0
        var sum = 0
        
        for number in arr {
            sum += number
            
            while sum > s {
                sum -= arr[lowerBound]
                lowerBound += 1
            }
            
            let currentLength = upperBound - lowerBound
            if sum == s && maxLength < currentLength {
                maxRange = (lowerBound + 1)...(upperBound + 1)
                maxLength = currentLength
            }
            
            upperBound += 1
        }
        
        return maxRange == nil ? [-1] : [maxRange!.lowerBound, maxRange!.upperBound]
    }
    
}
