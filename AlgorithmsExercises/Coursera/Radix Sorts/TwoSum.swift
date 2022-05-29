//
//  TwoSum.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/03/2022.
//
//  2-sum.
//  Given an array a of n 64-bit integers and a target value T, determine whether there are two distinct integers i and j such that a_i + a_j = T.
//  Your algorithm should run in linear time in the worst case.
//

import Foundation
import SwiftAlgorithms

class TwoSum {
    
    func findWithLSD(_ array: inout [Int], target: Int) -> (Int, Int)? {
        LSDSort().sort(&array)
        
        var i = 0
        var j = array.count - 1
        
        while i < j {
            let sum = array[i] + array[j]
            if sum < target { i += 1 }
            else if sum > target { j -= 1 }
            else { return (array[i], array[j]) }
        }
        
        return nil
    }
    
    func find(_ array: [Int], target: Int) -> (Int, Int)? {
        var map = [Int: Bool]()
        
        for element in array {
            let complement = target - element
            
            if map[complement, default: false] {
                return (complement, element)
            }
            
            map[element] = true
        }
        
        return nil
    }
    
}
