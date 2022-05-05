//
//  SumOfTwo.swift
//  AlgorithmsExercises
//
//  Created by hg on 21/05/2022.
//
//  You have two integer arrays, a and b, and an integer target value v.
//  Determine whether there is a pair of numbers, where one number is taken from a and the other from b, that can be added together to get a sum of v.
//  Return true if such a pair exists, otherwise return false.
//

import Foundation

class SumOfTwo {
    
    func solve(a: [Int], b: [Int], v: Int) -> Bool {
        let set = Set<Int>(a)
        return b.first { set.contains(v - $0) } != nil
    }
    
}
