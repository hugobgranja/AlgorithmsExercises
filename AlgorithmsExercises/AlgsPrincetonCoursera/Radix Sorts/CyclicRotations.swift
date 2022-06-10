//
//  CyclicRotations.swift
//  AlgorithmsExercises
//  Created by hg on 01/04/2022.
//
//  Cyclic rotations.
//  Two strings s and t are cyclic rotations of one another if they have the same length and s consists of a suffix of t followed by a prefix of t.
//  For example, "suffixsort" and "sortsuffix" are cyclic rotations.
//
//  Given n distinct strings, each of length L, design an algorithm to determine whether there exists a pair of distinct strings that are cyclic rotations of one another.
//  For example, the following list of n = 12 strings of length L = 10 contains exactly one pair of strings ("suffixsort" and "sortsuffix") that are cyclic rotations of one another.
//
//  algorithms polynomial sortsuffix boyermoore
//  structures minimumcut suffixsort stackstack
//  binaryheap digraphdfs stringsort digraphbfs
//
//  The order of growth of the running time should be nL^2 (or better) in the worst case.
//  Assume that the alphabet size R is a small constant.
//  Signing bonus. Do it in NnL time in the worst case.
//
//  Hint: define a fingerprint of a string in such a way that two strings are cyclic rotations of one another if and only if they have the same fingerprint.
//  Signing bonus: design an algorithm to find the fingerprint of a string of length L in time proportional to L in the worst case.
//

import Foundation
import SwiftAlgorithms

class CyclicRotations {
    
    func exists(_ array: [String], length: Int) -> Bool {
        var fingerprints = Set<String>()
        
        for str in array {
            var suffixes = (1...length).map { String(str.suffix($0)) }
            
            ThreeWayRadixQSort().sort(&suffixes)
            
            let fingerprint = suffixes[0] + str.prefix(str.count - suffixes[0].count)
            
            if fingerprints.contains(fingerprint) {
                return true
            }
            
            fingerprints.insert(fingerprint)
        }
        
        return false
    }
    
}
