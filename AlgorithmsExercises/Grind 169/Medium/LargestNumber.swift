//
//  LargestNumber.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Largest Number|
//  |String|Greedy|Sorting|
//  Given a list of non-negative integers nums, arrange them such that they form the largest number and return it.
//  The result may be very large so you need to return a string instead of an integer.
//

import Foundation

class LargestNumber {
    
    func largestNumber(_ nums: [Int]) -> String {
        let num = nums
            .map { String($0) }
            .sorted { $0+$1 > $1+$0 }
            .joined()
        
        return num.first == "0" ? "0" : num
    }
    
}
