//
//  Intersection.swift
//  AlgorithmsExercises
//  Created by hg on 17/10/2020.
//
//  Intersection of two sets.
//  Given two arrays a[] and b[], each containing nn distinct 2D points in the plane, design a subquadratic algorithm to count the number of points that are contained both in array a[] and array b[].
//

import Foundation
import SwiftAlgorithms

class Intersection {
    
    func count<T: Comparable>(_ a: [T], _ b: [T]) -> Int {
        let sort = ShellSort()
        var acopy = a
        var bcopy = b
        
        sort.sort(&acopy)
        sort.sort(&bcopy)
        
        var i = 0
        var j = 0
        var intersectionCount = 0
        while i < a.count && j < b.count {
            if acopy[i] < bcopy[j] { i += 1 }
            else if bcopy[j] < acopy[i] { j += 1 }
            else {
                intersectionCount += 1
                i += 1
                j += 1
            }
        }
        
        return intersectionCount
    }
    
}
