//
//  ReverseInteger.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Reverse Integer|
//  |
//  Given a signed 32-bit integer x, return x with its digits reversed.
//  If reversing x causes the value to go outside the signed 32-bit integer range, then return 0.
//  Assume the environment does not allow you to store 64-bit integers (signed or unsigned).
//

import Foundation

class ReverseInteger {
    
    func reverse(_ x: Int) -> Int {
        var x = x
        var rev = 0
        
        while x != 0 {
            let nextDigit = x % 10
            x /= 10
            if willOverflow(rev, nextDigit) { return 0 }
            rev = rev * 10 + nextDigit
        }
        
        return rev
    }
    
    func willOverflow(_ rev: Int, _ nextDigit: Int) -> Bool {
        (rev > Int32.max / 10) || (rev == Int32.max / 10 && nextDigit > 7) ||
        (rev < Int32.min / 10) || (rev == Int32.min / 10 && nextDigit < -8)
    }
    
}
