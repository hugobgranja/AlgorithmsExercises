//
//  SingleNumber.swift
//  AlgorithmsExercises
//  Created by hg on 29/05/2022.
//
//  |Single Number|
//  |Bit Manipulation|
//  Given a non-empty array of integers nums, every element appears twice except for one.
//  Find that single one.
//  You must implement a solution with a linear runtime complexity and use only constant extra space.
//

import Foundation

class SingleNumber {
    
    func solve(_ nums: [Int]) -> Int {
        return nums.reduce(0, ^)
    }
    
}
