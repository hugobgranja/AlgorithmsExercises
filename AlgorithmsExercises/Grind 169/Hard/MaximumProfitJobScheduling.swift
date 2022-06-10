//
//  MaximumProfitJobScheduling.swift
//  AlgorithmsExercises
//  Created by hg on 28/06/2022.
//
//  |Maximum Profit in Job Scheduling|
//  |Array|Dynamic Programming|Binary Search|Sorting|
//  We have n jobs, where every job is scheduled to be done from startTime[i] to endTime[i], obtaining a profit of profit[i].
//  You're given the startTime, endTime and profit arrays, return the maximum profit you can take such that there are no two jobs in the subset with overlapping time range.
//  If you choose a job that ends at time X you will be able to start another job that starts at time X.
//

import Foundation

class MaximumProfitJobScheduling {
    
    private typealias Job = (startTime: Int, endTime: Int, profit: Int)
    
    // Top-down + Binary Search to find the next schedulable job
    func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        func dfs(_ currentIndex: Int) -> Int {
            guard currentIndex < jobs.endIndex else { return 0 }
            if memo[currentIndex] > 0 { return memo[currentIndex] }
            let nextIndex = gte(to: currentIndex, in: jobs)
            let maxProfit = max(jobs[currentIndex].profit + dfs(nextIndex), dfs(currentIndex + 1))
            memo[currentIndex] = maxProfit
            return maxProfit
        }
        
        let jobs = startTime
            .indices
            .map { Job(startTime[$0], endTime[$0], profit[$0]) }
            .sorted { $0.startTime < $1.startTime }
        
        var memo = [Int](repeating: 0, count: jobs.count)
        return dfs(0)
    }
    
    // Bottom-up + Binary Search
    func jobScheduling2(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
        let jobs = startTime
            .indices
            .map { Job(startTime[$0], endTime[$0], profit[$0]) }
            .sorted { $0.startTime < $1.startTime }
        
        var memo = [Int](repeating: 0, count: jobs.count + 1)
        
        for index in jobs.indices.reversed() {
            let nextIndex = gte(to: index, in: jobs)
            memo[index] = max(jobs[index].profit + memo[nextIndex], memo[index + 1])
        }
        
        return memo[0]
    }
    
    private func gte(to index: Int, in jobs: [Job]) -> Int {
        var lowerBound = index + 1
        var upperBound = jobs.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            
            if jobs[mid].startTime >= jobs[index].endTime {
                upperBound = mid - 1
            } else {
                lowerBound = mid + 1
            }
        }
        
        return lowerBound
    }
    
}
