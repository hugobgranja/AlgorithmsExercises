//
//  RotateArray.swift
//  AlgorithmsExercises
//  Created by hg on 13/06/2022.
//
//  |Rotate Array|
//  |Array|Two Pointers|
//  Given an array, rotate the array to the right by k steps, where k is non-negative.
//

import Foundation

class RotateArray {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, k - 1)
        reverse(&nums, k, nums.count - 1)
    }
    
    private func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var left = left, right = right
        
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
    
}
