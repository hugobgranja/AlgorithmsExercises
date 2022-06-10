//
//  BitonicArray.swift
//  AlgorithmsExercises
//  Created by hg on 18/10/2020.
//
//  Search in a bitonic array.
//  An array is bitonic if it is comprised of an increasing sequence of integers followed immediately by a decreasing sequence of integers.
//  Write a program that, given a bitonic array of n distinct integer values, determines whether a given integer is in the array.
//  Standard version: Use ∼3lgn compares in the worst case.
//  Signing bonus: Use ∼2lgn compares in the worst case.
//

import Foundation
import SwiftAlgorithms

class BitonicArray {
    
    func contains(_ array: [Int], _ element: Int) -> Bool {
        guard let mid = maxIndex(array) else { return false }
        let ascendingContains =  BinarySearch().indexOf(array, element, 0, mid) != nil
        let descendingContains = descendingOrderBinarySearch(array, element, mid + 1, array.count - 1) != nil
        return ascendingContains || descendingContains
    }
    
    private func descendingOrderBinarySearch<T: Comparable>(_ array: [T], _ element: T, _ low: Int, _ high: Int) -> Int? {
        var low = low, high = high
        
        while low <= high {
            let mid = low + (high - low) / 2
            if element < array[mid] { low = mid + 1 }
            else if element > array[mid] { high = mid - 1}
            else { return mid }
        }
        
        return nil
    }
    
    func maxIndex(_ array: [Int]) -> Int? {
        if array.isEmpty { return nil }
        return maxIndex(array, 0, array.count - 1)
    }
    
    private func maxIndex(_ array: [Int], _ low: Int, _ high: Int) -> Int {
        if low == high { return high }
        let mid = low + (high - low) / 2
        if array[mid] < array[mid + 1] { return maxIndex(array, mid + 1, high) }
        if array[mid] > array[mid + 1] { return maxIndex(array, low, mid) }
        else { return mid }
    }
    
}
