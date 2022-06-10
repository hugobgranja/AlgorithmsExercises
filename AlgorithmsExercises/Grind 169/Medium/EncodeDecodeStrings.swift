//
//  EncodeDecodeStrings.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Encode and Decode Strings|
//  |Array|String|Design|
//  Design an algorithm to encode a list of strings to a string.
//  The encoded string is then sent over the network and is decoded back to the original list of strings.
//

import Foundation

class EncodeDecodeStrings {
    
    func encode(_ strs: [String]) -> String {
        return strs.map { "\($0.count)/\($0)" }.joined()
    }
    
    func decode(_ str: String) -> [String] {
        let charArr = [Character](str)
        var decoded = [String]()
        var index = 0
        
        while index < charArr.count {
            let length = charArr[index].wholeNumberValue!
            let startIndex = index + 2
            let endIndex = startIndex + length
            decoded.append(String(charArr[startIndex..<endIndex]))
            index = endIndex
        }
        
        return decoded
    }
    
}
