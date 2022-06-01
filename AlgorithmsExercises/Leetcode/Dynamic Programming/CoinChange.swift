//
//  CoinChange.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//
//  You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.
//  Return the fewest number of coins that you need to make up that amount.
//  If that amount of money cannot be made up by any combination of the coins, return -1.
//  You may assume that you have an infinite number of each kind of coin.
//

import Foundation

class CoinChange {
    
    func solve(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for a in 1...amount {
            for coin in coins {
                if a - coin >= 0 {
                    dp[a] = min(dp[a], 1 + dp[a - coin])
                }
            }
        }
        
        return dp[amount] != amount + 1 ? dp[amount] : -1
    }
    
    func solve2(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return 0 }
        
        var dp = [Int](repeating: amount + 1, count: amount + 1)
        dp[0] = 0
        
        for coin in coins where coin <= amount {
            for a in coin...amount {
                dp[a] = min(dp[a], 1 + dp[a - coin])
            }
        }
        
        return dp[amount] != amount + 1 ? dp[amount] : -1
    }
    
}
