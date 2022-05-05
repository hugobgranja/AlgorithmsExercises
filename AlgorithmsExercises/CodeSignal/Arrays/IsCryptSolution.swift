//
//  IsCryptSolution.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/04/2022.
//
//  A cryptarithm is a mathematical puzzle for which the goal is to find the correspondence between letters and digits, such that the given arithmetic equation consisting of letters holds true when the letters are converted to digits.
//  You have an array of strings crypt, the cryptarithm, and an an array containing the mapping of letters and digits, solution.
//  The array crypt will contain three non-empty strings that follow the structure: [word1, word2, word3], which should be interpreted as the word1 + word2 = word3 cryptarithm.
//  If crypt, when it is decoded by replacing all of the letters in the cryptarithm with digits using the mapping in solution, becomes a valid arithmetic equation containing no numbers with leading zeroes, the answer is true.
//  If it does not become a valid arithmetic solution, the answer is false.
//  Note that number 0 doesn't contain leading zeroes (while for example 00 or 0123 do).
//
//  Guaranteed constraints:
//  crypt.length = 3,
//  1 ≤ crypt[i].length ≤ 14
//

import Foundation

class IsCryptSolution {
    
    func solve(crypt: [String], solution: [[Character]]) -> Bool {
        let code = solution.reduce(into: [Character: Character]()) { $0[$1[0]] = $1[1] }
        
        if
            let first = decrypt(str: crypt[0], code: code),
            let second = decrypt(str: crypt[1], code: code),
            let result = decrypt(str: crypt[2], code: code)
        {
            return first + second == result
        }
        
        return false
    }
    
    private func decrypt(str: String, code: [Character: Character]) -> Int? {
        if str.count > 1 && str.first.map({ code[$0] }) == "0" { return nil }
        
        var decodedStr = ""
        
        for char in str {
            guard let number = code[char] else { return nil }
            decodedStr.append(number)
        }
        
        return Int(decodedStr)
    }
    
}
