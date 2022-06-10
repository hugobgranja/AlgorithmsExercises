//
//  BasicCalculator.swift
//  AlgorithmsExercises
//  Created by hg on 27/06/2022.
//
//  |Basic Calculator|
//  |Math|String|Stack|
//  Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.
//

import Foundation

class BasicCalculator {
    
    func calculate(_ s: String) -> Int {
        var currentNumber = 0
        var sign = 1
        var result = 0
        var stack = [sign]
        
        for char in s {
            switch char {
            case _ where char.isWholeNumber:
                currentNumber = (currentNumber * 10) + char.wholeNumberValue!
                
            case "(":
                stack.append(sign)
                
            case ")":
                stack.removeLast()
                
            case "+", "-":
                result += sign * currentNumber
                sign = (char == "+" ? 1 : -1) * stack.last!
                currentNumber = 0
                
            default:
                break
            }
        }
        
        return result + sign * currentNumber
    }
    
}
