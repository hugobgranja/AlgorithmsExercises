//
//  DailyTemperatures.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//
//  |Daily Temperatures|
//  |Stack|Monotonic Stack|
//  Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature.
//  If there is no future day for which this is possible, keep answer[i] == 0 instead.
//

import Foundation

class DailyTemperatures {
    
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var result = [Int](repeating: 0, count: temperatures.count)
        
        for (day, temperature) in temperatures.enumerated() {
            while !stack.isEmpty, temperature > temperatures[stack.last!] {
                let tempDay = stack.popLast()!
                result[tempDay] = day - tempDay
            }

            stack.append(day)
        }
        
        return result
    }
    
    // Optimized back to front, allows skipping multiple days.
    func dailyTemperatures2(_ temperatures: [Int]) -> [Int] {
        var hottest = 0
        var result = [Int](repeating: 0, count: temperatures.count)
        
        for (day, currentTemp) in temperatures.enumerated().reversed() {
            if currentTemp >= hottest {
                hottest = currentTemp
            }
            else {
                var days = 1
                
                while temperatures[day + days] <= currentTemp {
                    days += result[day + days]
                }
                
                result[day] = days
            }
        }
        
        return result
    }
    
}
