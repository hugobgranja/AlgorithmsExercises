//
//  ContainsDuplicates.swift
//  AlgorithmsExercises
//
//  Created by hg on 21/05/2022.
//
//  Given an array of integers, write a function that determines whether the array contains any duplicates. Your function should return true if any element appears at least twice in the array, and it should return false if every element is distinct.
//

import Foundation

class ContainsDuplicates {
    
    func solve(a: [Int]) -> Bool {
        var set = Set<Int>()
        
        for elem in a {
            if set.contains(elem) { return true }
            set.insert(elem)
        }
        
        return false
    }
    
}
