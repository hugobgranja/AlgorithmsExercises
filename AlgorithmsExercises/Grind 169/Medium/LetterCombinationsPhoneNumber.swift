//
//  LetterCombinationsPhoneNumber.swift
//  AlgorithmsExercises
//  Created by hg on 08/06/2022.
//
//  |Letter Combinations of a Phone Number|
//  |String|Backtracking|
//  Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//  A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//

import Foundation

class LetterCombinationsPhoneNumber {
    
    let map: [Character: [String]] = [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "l", "k"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func letterCombinationsBFS(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        var result = [""]
        
        for digit in digits {
            var newResult = [String]()
            
            for str in result {
                for char in map[digit]! {
                    newResult.append(str + char)
                }
            }
            
            result = newResult
        }
        
        return result
    }
    
    func letterCombinationsDFS(_ digits: String) -> [String] {
        func dfs<T: StringProtocol>(_ digits: T, _ word: String) {
            guard let digit = digits.first else {
                result.append(word)
                return
            }
            
            for char in map[digit]! {
                dfs(digits.dropFirst(), word + char)
            }
        }
        
        guard !digits.isEmpty else { return [] }
        var result = [String]()
        dfs(digits, "")
        return result
    }
    
}
