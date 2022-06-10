//
//  IsPermutation.swift
//  AlgorithmsExercises
//  Created by hg on 17/10/2020.
//
//  Permutation.
//  Given two integer arrays of size n, design a subquadratic algorithm to determine whether one is a permutation of the other.
//  That is, do they contain exactly the same entries but, possibly, in a different order.
//

import Foundation
import SwiftAlgorithms

class IsPermutation {
    
    func isPermutation<T: Comparable>(_ a: [T], _ b: [T]) -> Bool {
        guard a.count == b.count else { return false }
        var acopy = a
        var bcopy = b
        
        let sort = ShellSort()
        sort.sort(&acopy)
        sort.sort(&bcopy)
        
        let count = a.count
        for i in 0..<count {
            if acopy[i] != bcopy[i] { return false }
        }
        
        return true
    }
    
}
