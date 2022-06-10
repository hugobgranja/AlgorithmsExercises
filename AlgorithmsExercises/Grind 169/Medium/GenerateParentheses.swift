//
//  GenerateParentheses.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Generate Parentheses|
//  |String|Backtracking|
//  Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
//

import Foundation

class GenerateParentheses {
    
    func generateParenthesis(_ n: Int) -> [String] {
        func dfs(_ openCount: Int, _ closedCount: Int) {
            if openCount == n && closedCount == n {
                result.append(stack)
                return
            }
            
            if openCount < n {
                stack.append("(")
                dfs(openCount + 1, closedCount)
                stack.removeLast()
            }
            
            if closedCount < openCount {
                stack.append(")")
                dfs(openCount, closedCount + 1)
                stack.removeLast()
            }
        }
        
        var result = [String]()
        var stack = ""
        dfs(0,0)
        return result
    }
    
    func generateParenthesis2(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }
        var result = [String]()
        
        for c in 0..<n {
            for left in generateParenthesis2(c) {
                for right in generateParenthesis2(n - 1 - c) {
                    result.append("(\(left))\(right)")
                }
            }
        }
        
        return result
    }
    
}
