//
//  MissingNumber.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//
//  |Missing Number|
//  |Bit Manipulation|
//  Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
//

import Foundation

class MissingNumber {
    
    func solveSet(_ nums: [Int]) -> Int {
        var set = Set(0...nums.count)
        for num in nums { set.remove(num) }
        return set.first!
    }
    
    func solveXOR(_ nums: [Int]) -> Int {
        var xorSum = 0
        
        for index in nums.indices {
            xorSum ^= index ^ nums[index]
        }
        
        return xorSum ^ nums.count
    }
    
    func solveSum(_ nums: [Int]) -> Int {
        var result = nums.count
        
        for (index, num) in nums.enumerated() {
            result += (index - num)
        }
        
        return result
    }
    
}
