//
//  ProductExceptSelf.swift
//  AlgorithmsExercises
//
//  Created by hg on 22/05/2022.
//
//  You have an array nums.
//  We determine two functions to perform on nums.
//  In both cases, n is the length of nums:
//  fi(nums) = nums[0] * nums[1] * ... * nums[i - 1] * nums[i + 1] * ... * nums[n - 1].
//  (In other words, fi(nums) is the product of all array elements except the ithf.)
//  g(nums) = f0(nums) + f1(nums) + ... + fn-1(nums).
//  Using these two functions, calculate all values of f modulo the given m.
//  Take these new values and add them together to get g.
//  You should return the value of g modulo the given m.
//

import Foundation

class ProductExceptSelf {
    
    func solve(nums: [Int], m: Int) -> Int {
        let prefixProduct = nums.reduce(into: [1]) { $0.append(($0.last! * $1) % m) }
        var suffixProduct = 1
        var total = 0
        
        for index in nums.indices.reversed() {
            total += (prefixProduct[index] * suffixProduct) % m
            suffixProduct = (suffixProduct * nums[index]) % m
        }
        
        return total % m
    }
    
    // https://blueblazin.github.io/codefighter/commontechniques/2017/12/19/productExceptSelf.html
    func solveHorner(nums: [Int], m: Int) -> Int {
        var g = 0
        var p = 1
        
        for x in nums {
            g = (g * x + p) % m
            p = (p * x) % m
        }
        
        return g
    }
    
}
