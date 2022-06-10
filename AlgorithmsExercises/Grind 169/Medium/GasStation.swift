//
//  GasStation.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Gas Station|
//  |Greedy|
//  There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].
//  You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station.
//  You begin the journey with an empty tank at one of the gas stations.
//  Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique
//

import Foundation

class GasStation {
    
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var startIndex = 0
        var net = 0
        var sum = 0
        
        for index in 0..<gas.count {
            let diff = gas[index] - cost[index]
            sum += diff
            net += diff
            
            if sum < 0 {
                sum = 0
                startIndex = index + 1
            }
        }
        
        return net < 0 ? -1 : startIndex
    }
    
}
