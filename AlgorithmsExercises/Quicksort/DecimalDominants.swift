//
//  DecimalDominants.swift
//  AlgorithmsExercises
//
//  Created by hg on 14/12/2020.
//
//  Decimal dominants.
//  Given an array with nn keys, design an algorithm to find all values that occur more than n/10 times.
//  The expected running time of your algorithm should be linear.
//

import Foundation
import SwiftAlgorithms

class DecimalDominants {
    
    // Using a dictionary to count
    func findV0<T>(_ a: [T]) -> [T] where T: Comparable, T: Hashable {
        let threshold = a.count / 10
        var counts = [T: Int]()
        for element in a { counts[element, default: 0] += 1 }
        return Array(counts.filter { $0.value > threshold }.keys)
    }
    
    // Using the Boyer-Moore majority vote algorithm
    func findV1<T: Comparable>(_ a: [T]) -> [T] {
        var values = [T?](repeating: nil, count: 9)
        var counts = [Int](repeating: 0, count: 9)
        
        for element in a {
            if let index = values.firstIndex(of: element) {
                counts[index] += 1
            }
            else if let emptyIndex = counts.firstIndex(of: 0) {
                values[emptyIndex] = element
                counts[emptyIndex] = 1
            }
            else {
                for index in 0..<9 {
                    counts[index] -= 1
                    if counts[index] == 0 { values[index] = nil }
                }
            }
        }
        
        let finalValues = values.compactMap { $0 }
        var finalCounts = [Int](repeating: 0, count: finalValues.count)
        
        for element in a {
            if let index = finalValues.firstIndex(of: element) {
                finalCounts[index] += 1
            }
        }
        
        let threshold = a.count / 10
        return finalValues.enumerated().filter { finalCounts[$0.offset] > threshold }.map { $0.element }
    }
    
    // Using quick select with three way partition
    func findV2<T: Comparable>(_ a: inout [T]) -> [T] {
        let threshold = a.count / 10
        var k = threshold
        var low = 0, high = a.count - 1
        var values = [T]()
        
        a.shuffle()
        
        while k < a.count {
            let (element, lt, gt) = select(&a, low: low, high: high, k: k)!
            let length = gt - lt + 1
            if length > threshold { values.append(element) }
            low = gt + 1
            k = low + threshold
        }
        
        return values
    }
    
    private func select<T: Comparable>(_ a: inout [T], low: Int, high: Int, k: Int) -> (T,Int,Int)? {
        guard k >= 0 && k < a.count else { return nil }
        let partition = ThreeWayPartition()
        var low = low, high = high
        var lt = low, gt = low
        
        while high > low {
            (lt, gt) = partition.partition(&a, low, high)
            if gt < k { low = gt + 1 }
            else if lt > k { high = lt - 1 }
            else { return (a[k], lt, gt) }
        }
        
        return (a[k], low, high)
    }
    
}
