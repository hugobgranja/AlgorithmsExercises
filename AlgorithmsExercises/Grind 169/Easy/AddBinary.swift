//
//  AddBinary.swift
//  AlgorithmsExercises
//  Created by hg on 27/05/2022.
//
//  |Add Binary|
//  |String|Math|Bit Manipulation|Simulation|
//  Given two binary strings a and b, return their sum as a binary string.
//

import Foundation

class AddBinary {
    
    func solve(_ a: String, _ b: String) -> String {
        let a = [Character](a.reversed())
        let b = [Character](b.reversed())
        var result = ""
        var carry = 0
        
        for index in 0..<max(a.count, b.count) {
            var numA = 0
            var numB = 0
            
            if index < a.count {
                numA = a[index].wholeNumberValue!
            }
            
            if index < b.count {
                numB = b[index].wholeNumberValue!
            }
            
            let sum = numA + numB + carry
            let binSum = sum % 2
            carry = sum / 2
            result += "\(binSum)"
        }
        
        if carry == 1 { result += "1" }
        
        return String(result.reversed())
    }
    
}
