//
//  HouseRobber.swift
//  AlgorithmsExercises
//  Created by hg on 20/05/2022.
//
//  |House Robber|
//  |Dynamic Programming|
//  You are planning to rob houses on a specific street, and you know that every house on the street has a certain amount of money hidden.
//  The only thing stopping you from robbing all of them in one night is that adjacent houses on the street have a connected security system.
//  The system will automatically trigger an alarm if two adjacent houses are broken into on the same night.
//  Given a list of non-negative integers nums representing the amount of money hidden in each house, determine the maximum amount of money you can rob in one night without triggering an alarm.
//

import Foundation

class HouseRobber {
    
    func solve(nums: [Int]) -> Int {
        var a = 0, b = 0
        
        for num in nums {
            let temp = max(num + a, b)
            a = b
            b = temp
        }
        
        return b
    }
    
}
