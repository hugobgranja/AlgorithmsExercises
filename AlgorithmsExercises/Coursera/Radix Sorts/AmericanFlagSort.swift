//
//  AmericanFlagSort.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/03/2022.
//
//  American flag sort.
//  Given an array of n objects with integer keys between 0 and R−1, design a linear-time algorithm to rearrange them in ascending order.
//  Use extra space at most proportional to R.
//

import Foundation

class AmericanFlagSort {
    
    // (T, Key) pairs where T is any and key is Int
    // N = array length, R = radix
    // O(N + R) time.
    // O(2R) space.
    func sort<T>(_ array: inout [(T, Int)], radix: Int) {
        var count = [Int](repeating: 0, count: radix)
        var accCount = [Int](repeating: 0, count: radix + 1)
        
        for (_, key) in array {
            count[key] += 1
        }
        
        for i in 0..<radix {
            accCount[i + 1] = count[i] + accCount[i]
        }
        
        var index = 0
        while index < array.count - 1 {
            let key = array[index].1
            let remaining = count[key]
            let pos = accCount[key + 1] - remaining
            
            if index != pos && remaining > 0 {
                array.swapAt(index, pos)
                count[key] -= 1
            }
            else {
                index += 1
            }
        }
    }
    
}
