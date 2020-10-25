//
//  MergeSmallerAuxArray.swift
//  AlgorithmsExercises
//
//  Created by hg on 30/10/2020.
//
//  Merging with smaller auxiliary array.
//  Suppose that the subarray a[0] to a[n−1] is sorted and the subarray a[n] to a[2*n−1] is sorted.
//  How can you merge the two subarrays so that a[0] to a[2*n−1] is sorted using an auxiliary array of length n (instead of 2n)?
//

import Foundation

class MergeSmallerAuxArray {
    
    func merge<T: Comparable>(_ a: inout [T], _ low: Int, _ mid: Int, _ high: Int) {
        let left = [T](a[low...mid])
        
        var i = 0, j = mid + 1
        for k in low...high {
            if i >= left.count {
                a[k] = a[j]
                j += 1
            }
            else if j > high {
                a[k] = left[i]
                i += 1
            }
            else if a[j] < left[i] {
                a[k] = a[j]
                j += 1
            }
            else {
                a[k] = left[i]
                i += 1
            }
        }
    }
    
}
