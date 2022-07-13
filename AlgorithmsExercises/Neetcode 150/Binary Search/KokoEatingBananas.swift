//
//  KokoEatingBananas.swift
//  AlgorithmsExercises
//  Created by hg on 10/07/2022.
//
//  |Koko Eating Bananas|
//  |Array|Binary Search|
//  Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas.
//  The guards have gone and will come back in h hours.
//  Koko can decide her bananas-per-hour eating speed of k.
//  Each hour, she chooses some pile of bananas and eats k bananas from that pile.
//  If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.
//  Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.
//  Return the minimum integer k such that she can eat all the bananas within h hours.
//

import Foundation

class KokoEatingBananas {
    
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard var right = piles.max() else { return 0 }
        var left = 1
        
        while left < right {
            let speed = left + (right - left) / 2
            
            if hoursToEat(piles, at: speed) <= h {
                right = speed
            }
            else {
                left = speed + 1
            }
        }
        
        return left
    }
    
    private func hoursToEat(_ piles: [Int], at speed: Int) -> Int {
        return piles.reduce(0) {
            $0 + Int((Double($1) / Double(speed)).rounded(.up))
        }
    }
    
}
