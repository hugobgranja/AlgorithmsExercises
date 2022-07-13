//
//  PalindromePartitioning.swift
//  AlgorithmsExercises
//  Created by hg on 13/07/2022.
//
//  |Palindrome Partitioning|
//  |Backtracking|Dynamic Programming|
//  Given a string s, partition s such that every substring of the partition is a palindrome.
//  Return all possible palindrome partitioning of s.
//  A palindrome string is a string that reads the same backward as forward.
//

import Foundation

class PalindromePartitioning {
    
    func partition(_ s: String) -> [[String]] {
        func dfs(_ index: String.Index) {
            guard index < s.endIndex else {
                result.append(partition)
                return
            }
            
            for endIndex in s.indices[index..<s.endIndex] {
                let substring = s[index...endIndex]
                
                if isPalindrome(substring) {
                    partition.append(String(substring))
                    let nextIndex = s.index(after: endIndex)
                    dfs(nextIndex)
                    partition.removeLast()
                }
            }
        }
        
        var result = [[String]]()
        var partition = [String]()
        dfs(s.startIndex)
        return result
    }
    
    private func isPalindrome<T: StringProtocol>(_ s: T) -> Bool {
        guard !s.isEmpty else { return true }
        
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        
        while left < right {
            if s[left] != s[right] { return false }
            left = s.index(after: left)
            right = s.index(before: right)
        }
        
        return true
    }
    
}
