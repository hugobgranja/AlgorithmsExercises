//
//  NutsAndBolts.swift
//  AlgorithmsExercises
//  Created by hg on 08/11/2020.
//
//  Nuts and bolts.
//  A disorganized carpenter has a mixed pile of n nuts and n bolts.
//  The goal is to find the corresponding pairs of nuts and bolts.
//  Each nut fits exactly one bolt and each bolt fits exactly one nut.
//  By fitting a nut and a bolt together, the carpenter can see which one is bigger (but the carpenter cannot compare two nuts or two bolts directly).
//  Design an algorithm for the problem that uses at most proportional to nlogn compares (probabilistically).
//

import Foundation

class NutsAndBolts {
    
    func sort(nuts: inout [Int], bolts: inout [Int]) {
        nuts.shuffle()
        bolts.shuffle()
        sort(&nuts, &bolts, 0, nuts.count - 1)
    }
    
    private func sort(_ nuts: inout [Int], _ bolts: inout [Int], _ low: Int, _ high: Int) {
        guard high > low else { return }
        
        let j = partition(&nuts, low, high, bolts[high])
        _ = partition(&bolts, low, high, nuts[j])
        
        sort(&nuts, &bolts, low, j - 1)
        sort(&nuts, &bolts, j + 1, high)
    }
    
    private func partition<T: Comparable>(_ array: inout [T], _ low: Int, _ high: Int, _ pivot: T) -> Int {
        var i = low, j = high
        
        while true {
            while i != high && array[i] < pivot { i += 1 }
            while j != low && pivot < array[j] { j -= 1 }
            if i >= j { break }
            array.swapAt(i, j)
        }
        
        return j
    }
    
}
