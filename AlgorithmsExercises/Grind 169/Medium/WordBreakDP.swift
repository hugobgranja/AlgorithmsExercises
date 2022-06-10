//
//  WordBreakDP.swift
//  AlgorithmsExercises
//  Created by hg on 05/06/2022.
//
//  |Word Break|
//  |Dynamic Programming|Memoization|
//  Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
//  Note that the same word in the dictionary may be reused multiple times in the segmentation.
//

import Foundation

class WordBreakDP {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let charStr = Array(s)
        let wordSet = Set(wordDict)
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        
        for i in 1...charStr.count {
            for j in 0..<i {
                let substring = String(charStr[j..<i])
                if dp[j] && wordSet.contains(substring) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }

}
