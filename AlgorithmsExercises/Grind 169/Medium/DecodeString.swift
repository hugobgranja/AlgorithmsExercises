//
//  DecodeString.swift
//  AlgorithmsExercises
//  Created by hg on 13/06/2022.
//
//  |Decode String|
//  |String|Stack|
//  Given an encoded string, return its decoded string.
//  The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
//  You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].
//

import Foundation

class DecodeString {
    
    func decodeString(_ s: String) -> String {
        var repeatsStack = [Int]()
        var strStack = [""]
        var currentRepeat = ""
        
        for char in s {
            if char.isWholeNumber {
                currentRepeat.append(char)
            }
            else if char == "[" {
                repeatsStack.append(Int(currentRepeat)!)
                currentRepeat = ""
                strStack.append("")
            }
            else if char == "]" {
                let repeats = repeatsStack.popLast()!
                let str = strStack.popLast()!
                strStack[strStack.count - 1] += String(repeating: str, count: repeats)
            }
            else {
                strStack[strStack.count - 1].append(char)
            }
        }
        
        return strStack.popLast()!
    }
    
}
