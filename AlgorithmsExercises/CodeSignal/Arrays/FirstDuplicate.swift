//
//  FirstDuplicate.swift
//  AlgorithmsExercises
//
//  Created by hg on 26/04/2022.
//
//  Given an array a that contains only numbers in the range from 1 to a.length,
//  find the first duplicate number for which the second occurrence has the minimal index.
//  In other words, if there are more than 1 duplicated numbers, return the number for which
//  the second occurrence has a smaller index than the second occurrence of the other number does.
//  If there are no such elements, return nil.
//

import Foundation

class FirstDuplicate {
    
    func solve1(a: [Int]) -> Int? {
        var isPresent = [Bool](repeating: false, count: a.count)
        
        for element in a {
            if isPresent[element - 1] { return element }
            else { isPresent[element - 1] = true }
        }
        
        return nil
    }
    
    func solve2(a: [Int]) -> Int? {
        var set = Set<Int>()
        
        for element in a {
            if set.contains(element) { return element }
            else { set.insert(element) }
        }
        
        return nil
    }
    
    // No additional memory used, original array can be restored with another pass
    func solve3(a: inout [Int]) -> Int? {
        for index in 0..<a.count {
            let element = abs(a[index])
            
            if a[element - 1] < 0 {
                return element
            }
            else {
                a[element - 1] = -a[element - 1]
            }
        }
        
        return nil
    }
    
}
