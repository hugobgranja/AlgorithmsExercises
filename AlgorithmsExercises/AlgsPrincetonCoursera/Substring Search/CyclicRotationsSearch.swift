//
//  CyclicRotationsSeach.swift
//  AlgorithmsExercises
//  Created by hg on 07/04/2022.
//
//  Cyclic rotation of a string.
//  A string s is a cyclic rotation of a string t if s and t have the same length and s consists of a suffix of t followed by a prefix of t.
//  For example, "winterbreak" is a cyclic rotation of "breakwinter" (and vice versa).
//  Design a linear-time algorithm to determine whether one string is a cyclic rotation of another.
//

import Foundation
import SwiftAlgorithms

class CyclicRotationsSearch {
    
    func isCyclicRotation(_ first: String, _ second: String) -> Bool {
        guard first.count == second.count else { return false }
        let kmp = KMP(pattern: second)
        return kmp.search(first + first) != nil
    }
    
}
