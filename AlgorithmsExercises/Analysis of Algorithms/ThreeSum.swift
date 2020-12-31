//
//  ThreeSum.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/10/2020.
//
//  3-SUM in quadratic time.
//  Design an algorithm for the 3-SUM problem that takes time proportional to n^2 in the worst case.
//  You may assume that you can sort the n integers in time proportional to n^2 or better.
//

import Foundation
import SwiftAlgorithms

class ThreeSum {

    func find(_ array: [Int], sum: Int) -> (Int, Int, Int)? {
        var a = array
        let sort = ShellSort()
        sort.sort(&a)
        
        let count = a.count
        for i in 0..<count - 2 {
            var j = i + 1
            var k = count - 1
            
            while j < k {
                let currentSum = a[i] + a[j] + a[k]
                if currentSum > sum {
                    k -= 1
                }
                else if currentSum < sum {
                    j += 1
                }
                else {
                    return (a[i], a[j], a[k])
                }
            }
        }
        
        return nil
    }
    
}
