//
//  ContainsDuplicates.swift
//  AlgorithmsExercises
//  Created by hg on 21/05/2022.
//
//  |Contains Duplicate|
//  |Array|Hash Table|
//  Given an array of integers, write a function that determines whether the array contains any duplicates. Your function should return true if any element appears at least twice in the array, and it should return false if every element is distinct.
//
//  Alternative: Sort array look for repeated consecutive numbers O(nLogn) time O(1) space.
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
