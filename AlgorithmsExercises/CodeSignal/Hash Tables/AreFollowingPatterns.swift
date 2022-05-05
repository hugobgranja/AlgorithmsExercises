//
//  AreFollowingPatterns.swift
//  AlgorithmsExercises
//
//  Created by hg on 03/05/2022.
//
//  Given an array strings, determine whether it follows the sequence given in the patterns array.
//  In other words, there should be no i and j for which strings[i] = strings[j] and patterns[i] ≠ patterns[j] or for which strings[i] ≠ strings[j] and patterns[i] = patterns[j].
//
//  Example
//  For strings = ["cat", "dog", "dog"] and patterns = ["a", "b", "b"], the output should be
//  solution(strings, patterns) = true;
//  For strings = ["cat", "dog", "doggy"] and patterns = ["a", "b", "b"], the output should be
//  solution(strings, patterns) = false
//

import Foundation

class AreFollowingPatterns {
    
    func solve(strings: [String], patterns: [String]) -> Bool {
        var strToPatDict = [String: String]()
        var patToStrDict = [String: String]()
        
        for (str, pattern) in zip(strings, patterns) {
            if patToStrDict[pattern] == nil {
                patToStrDict[pattern] = str
            }
            else if patToStrDict[pattern] != str {
                return false
            }
            
            if strToPatDict[str] == nil {
                strToPatDict[str] = pattern
            }
            else if strToPatDict[str] != pattern {
                return false
            }
        }
        
        return true
    }
    
}
