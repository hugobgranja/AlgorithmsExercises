//
//  PossibleSums.swift
//  AlgorithmsExercises

//  Created by hg on 04/05/2022.
//
//  You have a collection of coins, and you know the values of the coins and the quantity of each type of coin in it.
//  You want to know how many distinct sums you can make from non-empty groupings of these coins.
//
//  Example
//  For coins = [10, 50, 100] and quantity = [1, 2, 1], the output should be
//  solution(coins, quantity) = 9.
//  Here are all the possible sums:
//  50 = 50;
//  10 + 50 = 60;
//  50 + 100 = 150;
//  10 + 50 + 100 = 160;
//  50 + 50 = 100;
//  10 + 50 + 50 = 110;
//  50 + 50 + 100 = 200;
//  10 + 50 + 50 + 100 = 210;
//  10 = 10;
//  100 = 100;
//  10 + 100 = 110.
//  As you can see, there are 9 distinct sums that can be created from non-empty groupings of your coins.
//

import Foundation

class PossibleSums {
    
    func solve(coins: [Int], quantity: [Int]) -> Int {
        var sums = Set<Int>([0])
        
        for (coin, quantity) in zip(coins, quantity) {
            let prevSums = sums
            
            for sum in prevSums {
                for q in 1...quantity {
                    sums.insert(sum + coin * q)
                }
            }
        }
        
        return sums.count - 1
    }

}
