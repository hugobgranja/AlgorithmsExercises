//
//  ProductOfArrayExceptSelf.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//
//  Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//  The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//  You must write an algorithm that runs in O(n) time and without using the division operation.
//

import Foundation

class ProductOfArrayExceptSelf {
    
    func solve(_ nums: [Int]) -> [Int] {
        var prefixProduct = nums.dropLast().reduce(into: [1]) { $0.append($0.last! * $1) }
        var suffixProduct = 1
        
        for index in nums.indices.reversed() {
            prefixProduct[index] *= suffixProduct
            suffixProduct *= nums[index]
        }
        
        return prefixProduct
    }
    
}
