//
//  ReversePolishNotation.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//
//  Evaluate the value of an arithmetic expression in Reverse Polish Notation.
//  Valid operators are +, -, *, and /. Each operand may be an integer or another expression.
//  Note that division between two integers should truncate toward zero.
//  It is guaranteed that the given RPN expression is always valid.
//  That means the expression would always evaluate to a result, and there will not be any division by zero operation.
//

import Foundation

class ReversePolishNotation {
    
    private let operations: [String: (Int, Int) -> Int] = [
        "+": { $0 + $1 },
        "-": { $0 - $1 },
        "*": { $0 * $1 },
        "/": { $0 / $1 }
    ]
    
    func solve(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            switch token {
            case "+", "-", "*", "/":
                let (a, b) = (stack.popLast()!, stack.popLast()!)
                let operation = operations[token]!
                stack.append(operation(b, a))
            default:
                stack.append(Int(token)!)
            }
        }
        
        return stack[0]
    }
    
    func solve2(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for token in tokens {
            switch token {
            case "+":
                stack.append(stack.popLast()! + stack.popLast()!)
                
            case "-":
                let (a, b) = (stack.popLast()!, stack.popLast()!)
                stack.append(b - a)
                
            case "*":
                stack.append(stack.popLast()! * stack.popLast()!)
                
            case "/":
                let (a, b) = (stack.popLast()!, stack.popLast()!)
                stack.append(b / a)
                
            default:
                stack.append(Int(token)!)
            }
        }
        
        return stack[0]
    }
    
}
