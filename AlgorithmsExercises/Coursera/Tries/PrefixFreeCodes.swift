//
//  PrefixFreeCodes.swift
//  AlgorithmsExercises
//
//  Created by hg on 04/04/2022.
//
//  Prefix free codes.
//  In data compression, a set of binary strings is prefix free if no string is a prefix of another.
//  For example, {01,10,0010,1111} is prefix free, but {01,10,0010,10100} is not because 10 is a prefix of 10100.
//  Design an efficient algorithm to determine if a set of binary strings is prefix-free.
//  The running time of your algorithm should be proportional the number of bits in all of the binary stings.
//

import Foundation

class PrefixFreeCodes {
    
    func isPrefixFree(set: Set<String>) -> Bool {
        let binaryTrieSet = BinaryTrieSet()
        
        for binaryString in set {
            binaryTrieSet.insert(binaryString)
        }
        
        for binaryString in set {
            if binaryTrieSet.longestPrefix(of: binaryString) != nil { return false }
        }
        
        return true
    }
    
}
