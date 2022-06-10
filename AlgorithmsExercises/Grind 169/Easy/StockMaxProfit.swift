//
//  StockMaxProfit.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//
//  |Best Time to Buy and Sell Stock|
//  |Array|Dynamic Programming|
//  You are given an array prices where prices[i] is the price of a given stock on the ith day.
//  You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
//  Return the maximum profit you can achieve from this transaction.
//  If you cannot achieve any profit, return 0.
//

import Foundation

class StockMaxProfit {
    
    func solve(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        
        var maxProfit = 0
        var lowestPrice = prices[0]
        
        for price in prices {
            if price < lowestPrice {
                lowestPrice = price
            }
            else if price > lowestPrice {
                let profit = price - lowestPrice
                maxProfit = max(maxProfit, profit)
            }
        }
        
        return maxProfit
    }
    
}
