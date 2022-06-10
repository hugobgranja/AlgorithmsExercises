//
//  DecodeWays.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Decode Ways|
//  |String|Dynamic Programming|
//  A message containing uppercase letters from 'A' to 'Z' has been encoded as numbers using the following mapping:
//  'A' -> 1 'B' -> 2 ... 'Z' -> 26
//  Determine the total number of ways that the message can be decoded.
//

import Foundation

class DecodeWays {
    
    func numDecodings(_ s: String) -> Int {
        guard !s.isEmpty else { return 1 }
        var a = 1
        var b = s.first! == "0" ? 0 : 1

        for (index, nextIndex) in zip(s.indices, s.indices.dropFirst()) {
            var c = 0
            
            if s[nextIndex] != "0" { c += b }
        
            let twoDigits = Int(s[index...nextIndex])!
            if (10...26).contains(twoDigits) { c += a }
            
            a = b
            b = c
        }

        return b
    }
    
}
