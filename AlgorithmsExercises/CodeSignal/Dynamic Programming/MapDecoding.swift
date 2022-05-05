//
//  MapDecoding.swift
//  AlgorithmsExercises
//
//  Created by hg on 20/05/2022.
//
//  Decode ways
//  A message containing uppercase letters from 'A' to 'Z' has been encoded as numbers using the following mapping:
//  'A' -> 1 'B' -> 2 ... 'Z' -> 26
//  Determine the total number of ways that the message can be decoded.
//  Since the answer could be very large, take it modulo 10^9 + 7.
//
//  Example
//  For message = "123", the output should be
//  solution(message) = 3.
//  "123" can be decoded as "ABC" (1 2 3), "LC" (12 3) or "AW" (1 23), so the total number of ways is 3.
//  https://www.youtube.com/watch?v=W4rYz-kd-cY
//

import Foundation

class MapDecoding {
    
    func solveRec(message: String) -> Int {
        var memo = [Int?](repeating: nil, count: message.count + 1)
        return auxRec(message: Substring(message), memo: &memo)
    }
    
    private func auxRec(message: Substring, memo: inout [Int?]) -> Int {
        if message.isEmpty { return 1 }
        if message.first! == "0" { return 0 }
        if let memoed = memo[message.count] { return memoed }
        
        let nextIndex = message.index(after: message.startIndex)
        var result = auxRec(message: message.suffix(from: nextIndex), memo: &memo)
        
        if message.count >= 2 && message.prefix(2) <= "26" {
            let afterNextIndex = message.index(after: nextIndex)
            result += auxRec(message: message.suffix(from: afterNextIndex), memo: &memo)
        }
        
        memo[message.count] = result
        return result
    }
    
    func solve2(message: String) -> Int {
        if message.isEmpty { return 1 }

        let mod = 1000000007
        var dp = [Int](repeating: 0, count: message.count + 1)
        dp[0] = 1
        dp[1] = message.first! == "0" ? 0 : 1

        for (dpIndex, mIndex) in zip(dp.indices.dropFirst(2), message.indices) {
            let nextIndex = message.index(after: mIndex)
            if message[nextIndex] != "0" { dp[dpIndex] += dp[dpIndex - 1] % mod }
        
            let firstTwo = Int(message[mIndex...nextIndex])!
            if (10...26).contains(firstTwo) {
                dp[dpIndex] += dp[dpIndex - 2] % mod
            }
        }

        return dp.last!
    }
    
    func solve(message: String) -> Int {
        guard !message.isEmpty else { return 1 }
        let mod = 1000000007
        var a = 1
        var b = message.first! == "0" ? 0 : 1

        for (index, nextIndex) in zip(message.indices, message.indices.dropFirst()) {
            var c = 0
            
            if message[nextIndex] != "0" { c += b }
        
            let two = Int(message[index...nextIndex])!
            if (10...26).contains(two) { c += a }
            
            a = b
            b = c % mod
        }

        return b
    }
    
}
