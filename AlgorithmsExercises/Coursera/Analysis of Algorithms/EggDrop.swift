//
//  EggDrop.swift
//  AlgorithmsExercises
//
//  Created by hg on 18/10/2020.
//
//  Egg drop.
//  Suppose that you have an n-story building (with floors 1 through n) and plenty of eggs.
//  An egg breaks if it is dropped from floor T or higher and does not break otherwise.
//  Your goal is to devise a strategy to determine the value of T given the following limitations on the number of eggs and tosses:
//  Version 0: 1 egg, <=T tosses.
//  Version 1: ∼1lgn eggs and ∼1lgn tosses.
//  Version 2: ∼lgT eggs and ∼2lgT tosses.
//  Version 3: 2 eggs and ∼2sqrtn tosses.
//  Version 4: 2 eggs and <=csqrtT tosses for some fixed constant c.
//

import Foundation

enum EggCondition {
    case whole
    case broken
}

class Building {
    var floors: Int
    var breakFloor: Int
    var throwCount: Int // Number of throws made for testing purposes
    var brokenEggs: Int // Number of eggs broken for testing purposes
    
    init(floors: Int, breakFloor: Int) {
        self.floors = floors
        self.breakFloor = breakFloor
        self.throwCount = 0
        self.brokenEggs = 0
    }
    
    func throwEgg(from floor: Int) -> EggCondition {
        throwCount += 1
        
        if floor >= breakFloor {
            brokenEggs += 1
            return .broken
        }
        
        return .whole
    }
}

class EggDrop {
    
    func versionZero(building: Building) -> Int? {
        return linearFloorSearch(building: building, start: 1, end: building.floors)
    }
    
    func versionOne(building: Building) -> Int? {
        return binaryFloorSearch(building: building, start: 1, end: building.floors)
    }
    
    func versionTwo(building: Building) -> Int? {
        var floor = 1
        
        while floor <= building.floors {
            if building.throwEgg(from: floor) == .broken {
                if floor == 1 { return 1 }
                else { return binaryFloorSearch(building: building, start: floor / 2, end: floor) }
            }
            
            floor *= 2
        }
        
        return binaryFloorSearch(building: building, start: floor / 2, end: building.floors)
    }
    
    func versionThree(building: Building) -> Int? {
        let stride = Int(sqrt(Double(building.floors)))
        var floor = 1
        
        while floor <= building.floors && building.throwEgg(from: floor) == .whole {
            floor += stride
        }
        
        let startFloor = floor - stride + 1
        let endFloor = min(floor, building.floors)
        
        return linearFloorSearch(building: building, start: startFloor, end: endFloor)
    }
    
    func versionFour(building: Building) -> Int? {
        var low = 1, high = 1, s = 1
        
        while high <= building.floors {
            switch building.throwEgg(from: high) {
            case .broken:
                return linearFloorSearch(building: building, start: low, end: high)
            case .whole:
                low += s
                high += s + 1
                s += 1
            }
        }
        
        return linearFloorSearch(building: building, start: low, end: building.floors)
    }
    
    private func linearFloorSearch(building: Building, start: Int, end: Int) -> Int? {
        for floor in start...end {
            if building.throwEgg(from: floor) == .broken {
                return floor
            }
        }
        
        return nil
    }
    
    private func binaryFloorSearch(building: Building, start: Int, end: Int) -> Int? {
        var low = start, high = end
        
        while low <= high {
            let mid = low + (high - low) / 2
            switch building.throwEgg(from: mid) {
            case .broken: high = mid - 1
            case .whole: low = mid + 1
            }
        }
        
        return low
    }
    
}
