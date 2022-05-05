//
//  ArrayMaxConsecutiveSum2.swift
//  AlgorithmsExercises
//
//  Created by hg on 22/05/2022.
//
//  Given an array of integers, find the maximum possible sum you can get from one of its contiguous subarrays.
//  The subarray from which this sum comes must contain at least 1 element.
//

import Foundation

class ArrayMaxConsecutiveSum2 {
    
    func solve(inputArray: [Int]) -> Int {
        var maxSum = inputArray[0]
        var currentSum = inputArray[0]

        for number in inputArray.dropFirst() {
            currentSum = max(currentSum + number, number)
            maxSum = max(maxSum, currentSum)
        }

        return maxSum
    }
    
}
