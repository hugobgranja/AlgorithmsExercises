//
//  4sum.swift
//  AlgorithmsExercises
//
//  Created by hg on 14/03/2021.
//
//  4-SUM.
//  Given an array a[] of n integers, the 4-SUM problem is to determine if there exist distinct indices i, j, k, and l such that a[i] + a[j] = a[k] + a[l].
//  Design an algorithm for the 4-SUM problem that takes time proportional to n^2n (under suitable technical assumptions).
//

import Foundation

class FourSum {
    
    func exists(_ a: [Int]) -> Bool {
        var set = Set<Int>()
        
        let count = a.count
        for i in 0..<count {
            for j in i + 1..<count {
                let sum = a[i] + a[j]
                if set.contains(sum) { return true }
                else { set.insert(sum) }
            }
        }
        
        return false
    }
    
    func solve(_ a: [Int]) -> [(Int, Int, Int, Int)] {
        var dict = [Int: [(Int,Int)]]()
        var solution = [(Int, Int, Int, Int)]()
        
        let count = a.count
        for i in 0..<count {
            for j in i + 1..<count {
                let sum = a[i] + a[j]
                
                if let list = dict[sum] {
                    let solutions = list.map { ($0.0, $0.1, i ,j) }
                    solution.append(contentsOf: solutions)
                }
                
                dict[sum, default: []].append((i, j))
            }
        }
        
        return solution
    }
    
}
