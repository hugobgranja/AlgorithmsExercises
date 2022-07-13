//
//  CarFleet.swift
//  AlgorithmsExercises
//  Created by hg on 10/07/2022.
//
//  |Car Fleet|
//  |Array|Stack|Sorting|Monotonic Stack|
//  There are n cars going to the same destination along a one-lane road.
//  The destination is target miles away.
//  You are given two integer array position and speed, both of length n, where position[i] is the position of the ith car and speed[i] is the speed of the ith car (in miles per hour).
//  A car can never pass another car ahead of it, but it can catch up to it and drive bumper to bumper at the same speed.
//  The faster car will slow down to match the slower car's speed. The distance between these two cars is ignored (i.e., they are assumed to have the same position).
//  A car fleet is some non-empty set of cars driving at the same position and same speed. Note that a single car is also a car fleet.
//  If a car catches up to a car fleet right at the destination point, it will still be considered as one car fleet.
//  Return the number of car fleets that will arrive at the destination.
//
//

import Foundation

class CarFleet {
    
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 < $1.0 }
        var stack = [Double]()

        for (position, speed) in cars.reversed() {
            let arrivalTime = Double(target - position) / Double(speed)
            
            if stack.isEmpty || arrivalTime > stack.last! {
                stack.append(arrivalTime)
            }
        }
        
        return stack.count
    }
    
    func carFleet2(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 < $1.0 }
        var fleetCount = 0
        var currentArrivalTime = 0.0

        for (position, speed) in cars.reversed() {
            let arrivalTime = Double(target - position) / Double(speed)
            
            if arrivalTime > currentArrivalTime {
                fleetCount += 1
                currentArrivalTime = arrivalTime
            }
        }
        
        return fleetCount
    }
    
}
