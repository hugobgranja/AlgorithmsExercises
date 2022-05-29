//
//  ValidParentheses.swift
//  AlgorithmsExercises
//
//  Created by hg on 25/05/2022.
//
//  Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//  An input string is valid if:
//  Open brackets must be closed by the same type of brackets.
//  Open brackets must be closed in the correct order.
//

import Foundation

class ValidParentheses {
    
    let map: [Character: Character] = [")": "(", "}": "{", "]": "["]
    
    func solve(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            switch char {
            case "(", "{", "[":
                stack.append(char)
                
            case ")", "}", "]":
                if stack.popLast() != map[char]! { return false }
                
            default:
                break
            }
        }
        
        return stack.isEmpty
    }
    
}
