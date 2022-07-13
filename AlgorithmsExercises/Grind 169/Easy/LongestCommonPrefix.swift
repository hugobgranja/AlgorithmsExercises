//
//  LongestCommonPrefix.swift
//  AlgorithmsExercises
//  Created by hg on 28/05/2022.
//
//  |Longest Common Prefix|
//  |String|
//  Write a function to find the longest common prefix string amongst an array of strings.
//  If there is no common prefix, return an empty string "".
//

import Foundation

class LongestCommonPrefix {
    
    func solve(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        let charArrays = strs.map { Array($0) }
        var isLCP = true
        var lcp = ""
        
        for index in charArrays[0].indices where isLCP {
            let char = charArrays[0][index]
            
            isLCP = charArrays
                .dropFirst()
                .allSatisfy { index < $0.count && $0[index] == char }

            if isLCP { lcp.append(char) }
        }
        
        return lcp
    }
    
    func solve2(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        let charArray = strs.map { Array($0) }
        
        for i in charArray[0].indices {
            for j in charArray.indices.dropFirst() {
                if i == charArray[j].count || charArray[j][i] != charArray[0][i] {
                    return String(charArray[0].prefix(i))
                }
            }
        }
        
        return strs[0]
    }
    
}
