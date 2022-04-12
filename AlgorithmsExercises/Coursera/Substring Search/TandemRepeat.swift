//
//  TandemRepeat.swift
//  AlgorithmsExercises
//
//  Created by hg on 07/04/2022.
//
//  Tandem repeat.
//  A tandem repeat of a base string b within a string s is a substring of s consisting of at least one consecutive copy of the base string b.
//  Given b and s, design an algorithm to find a tandem repeat of b within s of maximum length.
//  Your algorithm should run in time proportional to M + N, where M is length of b and N is the length s.
//  For example, if s is "abcabcababcaba" and b is "abcab", then "abcababcab" is the tandem substring of maximum length (2 copies).
//

import Foundation

class TandemRepeat {
    
    func findMaxTandemRepeat(in string: String, of base: String) -> Substring? {
        let kmp = TandemRepeatsKMP(pattern: base)
        return kmp.search(in: string).map { string[$0] }
    }
    
}
