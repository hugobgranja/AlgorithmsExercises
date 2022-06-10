//
//  BasicCalculatorII.swift
//  AlgorithmsExercises
//  Created by hg on 22/06/2022.
//
//  |Basic Calculator II|
//  |String|Math|Stack|
//  Given a string s which represents an expression, evaluate this expression and return its value.
//  The integer division should truncate toward zero.
//  You may assume that the given expression is always valid.
//  All intermediate results will be in the range of [-2^31, 2^31 - 1].
//

import Foundation

class BasicCalculatorII {
    
    // O(n) time, O(n) space
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var currentNumber = 0
        var operation: Character = "+"
        var index = s.startIndex
        
        while index < s.endIndex {
            let token = s[index]
            
            if token.isWholeNumber {
                while index < s.endIndex, let num = s[index].wholeNumberValue {
                    currentNumber = (currentNumber * 10) + num
                    index = s.index(after: index)
                }
                
                switch operation {
                case "+": stack.append(currentNumber)
                case "-": stack.append(-currentNumber)
                case "*": stack.append(stack.popLast()! * currentNumber)
                case "/": stack.append(stack.popLast()! / currentNumber)
                default: break
                }
                
                currentNumber = 0
            }
            else {
                if "+-/*".contains(token) { operation = token }
                index = s.index(after: index)
            }
        }
        
        return stack.reduce(0, +)
    }
    
    // O(n) time
    func calculate2(_ s: String) -> Int {
        var currentNumber = 0, lastNumber = 0, result = 0
        var operation: Character = "+"
        var index = s.startIndex
        
        while index < s.endIndex {
            let token = s[index]
            
            if token.isWholeNumber {
                while index < s.endIndex, let num = s[index].wholeNumberValue {
                    currentNumber = (currentNumber * 10) + num
                    index = s.index(after: index)
                }
                
                switch operation {
                case "+":
                    result += lastNumber
                    lastNumber = currentNumber
                    
                case "-":
                    result += lastNumber
                    lastNumber = -currentNumber
                    
                case "*":
                    lastNumber *= currentNumber
                    
                case "/":
                    lastNumber /= currentNumber
                    
                default:
                    break
                }
                
                currentNumber = 0
            }
            else {
                if "+-/*".contains(token) { operation = token }
                index = s.index(after: index)
            }
        }
        
        return result + lastNumber
    }
    
}
