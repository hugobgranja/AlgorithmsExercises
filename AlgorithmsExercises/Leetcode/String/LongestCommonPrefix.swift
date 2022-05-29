//
//  LongestCommonPrefix.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Write a function to find the longest common prefix string amongst an array of strings.
//  If there is no common prefix, return an empty string "".
//

import Foundation

class LongestCommonPrefix {
    
    func solve(_ strs: [String]) -> String {
        let charArrays = strs.map { Array($0) }
        let minCount = charArrays.min { $0.count < $1.count }?.count ?? 0
        var lcp = ""
        var isEveryCharEqual = true
        var index = 0
        
        while isEveryCharEqual && index < minCount {
            let char = charArrays[0][index]
            
            isEveryCharEqual = charArrays
                .dropFirst()
                .allSatisfy { $0[index] == char }
            
            if isEveryCharEqual {
                lcp.append(char)
                index += 1
            }
        }
        
        return lcp
    }
    
}
