//
//  AddBinary.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/05/2022.
//
//  Given two binary strings a and b, return their sum as a binary string.
//

import Foundation

class AddBinary {
    
    func solve(_ a: String, _ b: String) -> String {
        let a = a.reversed()
        let b = b.reversed()
        var result = ""
        var carry = 0
        
        for index in 0..<max(a.count, b.count) {
            var numA = 0
            var numB = 0
            
            if index < a.count {
                let indexA = a.index(a.startIndex, offsetBy: index)
                numA = a[indexA].wholeNumberValue!
            }
            
            if index < b.count {
                let indexB = b.index(b.startIndex, offsetBy: index)
                numB = b[indexB].wholeNumberValue!
            }
            
            let sum = numA + numB + carry
            let binSum = sum % 2
            carry = sum / 2
            result = "\(binSum)\(result)"
        }
        
        if carry == 1 { result = "1" + result }
        
        return result
    }
    
}
