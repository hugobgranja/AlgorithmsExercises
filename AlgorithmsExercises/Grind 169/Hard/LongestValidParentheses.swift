//
//  LongestValidParentheses.swift
//  AlgorithmsExercises
//  Created by hg on 04/07/2022.
//
//  |Longest Valid Parentheses|
//  |String|Dynamic Programming|Stack|
//  Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
//

import Foundation

class LongestValidParentheses {
    
    // Naive - O(n^3) time, O(n) space.
    func longestValidParentheses(_ s: String) -> Int {
        let chars = [Character](s)
        var longestCount = 0
        
        for i in chars.indices {
            for j in stride(from: i + 2, through: chars.count, by: 2) {
                if isValidParentheses(chars[i..<j]) {
                    longestCount = max(longestCount, j - i)
                }
            }
        }
        
        return longestCount
    }
    
    private func isValidParentheses(_ s: ArraySlice<Character>) -> Bool {
        var stack = [Character]()
        
        for char in s {
            switch char {
            case "(":
                stack.append(char)
                
            case ")":
                if stack.popLast() == nil { return false }
                
            default:
                break
            }
        }
        
        return stack.isEmpty
    }
    
    // DP - O(n) time, O(n) space
    func longestValidParentheses2(_ s: String) -> Int {
        let chars = [Character](s)
        var memo = [Int](repeating: 0, count: s.count)
        var longestCount = 0
        
        for (i, char) in chars.enumerated().dropFirst() {
            if char == ")" {
                if chars[i - 1] == "(" {
                    memo[i] = 2
                    if i >= 2 { memo[i] += memo[i - 2] }
                }
                else if i - memo[i - 1] > 0 && chars[i - memo[i - 1] - 1] == "(" {
                    memo[i] = 2 + memo[i - 1]
                    if i - memo[i - 1] >= 2 { memo[i] += memo[i - memo[i - 1] - 2] }
                }
                    
                longestCount = max(longestCount, memo[i])
            }
        }
        
        return longestCount
    }
    
    // Stack - O(n) time, O(n) space
    func longestValidParentheses3(_ s: String) -> Int {
        var stack = [-1]
        var longestCount = 0
        
        for (index, char) in zip(0..<s.count, s) {
            if char == "(" {
                stack.append(index)
            }
            else {
                _ = stack.popLast()
                
                if let last = stack.last {
                    longestCount = max(longestCount, index - last)
                }
                else {
                    stack.append(index)
                }
            }
        }
        
        return longestCount
    }
    
    // O(n) time
    func longestValidParentheses4(_ s: String) -> Int {
        var left = 0
        var right = 0
        var longestCount = 0
        
        for char in s {
            if char == "(" { left += 1 }
            else { right += 1 }
            
            if left == right {
                longestCount = max(longestCount, 2 * right)
            }
            else if right >= left {
                left = 0
                right = 0
            }
        }
        
        left = 0
        right = 0
        
        for char in s.reversed() {
            if char == "(" { left += 1 }
            else { right += 1 }
            
            if left == right {
                longestCount = max(longestCount, 2 * left)
            }
            else if left >= right {
                left = 0
                right = 0
            }
        }
        
        return longestCount
    }
    
}
