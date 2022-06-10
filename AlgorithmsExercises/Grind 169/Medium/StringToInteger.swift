//
//  StringToInteger.swift
//  AlgorithmsExercises
//  Created by hg on 05/06/2022.
//
//  |String to Integer (atoi)|
//  |Math|String|
//

import Foundation

class StringToInteger {
    
    func myAtoi(_ s: String) -> Int {
        let maxDivTen = Int(Int32.max) / 10
        var number = 0
        var sign = 1
        var index = s.startIndex
        
        while index < s.endIndex, s[index] == " " {
            index = s.index(after: index)
        }
        
        if index < s.endIndex {
            if s[index] == "+" {
                index = s.index(after: index)
            }
            else if s[index] == "-" {
                sign = -1
                index = s.index(after: index)
            }
        }
        
        while index < s.endIndex, let digit = s[index].wholeNumberValue {
            if number > maxDivTen || (number == maxDivTen && digit > 7) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            
            number = number * 10 + digit
            index = s.index(after: index)
        }
        
        return number * sign
    }
    
}
