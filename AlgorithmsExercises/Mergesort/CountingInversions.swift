//
//  CountingInversions.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/10/2020.
//
//  Counting inversions.
//  An inversion in an array a[] is a pair of entries a[i] and a[j] such that i < j but a[i] > a[j].
//  Given an array, design a linearithmic algorithm to count the number of inversions.
//

import Foundation

class CountingInversions {
    
    func countInversions<T: Comparable>(_ array: [T]) -> Int {
        var copy = array
        return countInversions(&copy, 0, array.count - 1)
    }
    
    private func countInversions<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int) -> Int {
        guard high > low else { return 0 }
        let mid = low + (high - low) / 2
        return countInversions(&array, low, mid) +
            countInversions(&array, mid + 1, high) +
            countInversions(&array, low, mid, high)
    }
    
    private func countInversions<T: Comparable>(_ a: inout [T], _ low: Int, _ mid: Int, _ high: Int) -> Int {
        let left = [T](a[low...mid])
        let right = [T](a[mid+1...high])
        var inversions = 0
        
        var i = 0, j = 0
        for k in low...high {
            if i >= left.count {
                a[k] = right[j]
                j += 1
            }
            else if j >= right.count {
                a[k] = left[i]
                i += 1
            }
            else if right[j] < left[i] {
                a[k] = right[j]
                j += 1
                inversions += mid - low - i + 1
            }
            else {
                a[k] = left[i]
                i += 1
            }
        }
        
        return inversions
    }
    
}
