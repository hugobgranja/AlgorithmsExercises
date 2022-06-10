//
//  AsteroidCollision.swift
//  AlgorithmsExercises
//  Created by hg on 16/06/2022.
//
//  |Asteroid Collision|
//  |Stack|
//  We are given an array asteroids of integers representing asteroids in a row.
//  For each asteroid, the absolute value represents its size, and the sign represents its direction (positive meaning right, negative meaning left).
//  Each asteroid moves at the same speed.
//  Find out the state of the asteroids after all collisions.
//  If two asteroids meet, the smaller one will explode.
//  If both are the same size, both will explode.
//  Two asteroids moving in the same direction will never meet.
//

import Foundation

class AsteroidCollision {
    
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var space = [Int]()
        
        for asteroid in asteroids {
            if asteroid > 0 { space.append(asteroid) }
            else { simulateImpacts(&space, asteroid) }
        }
        
        return space
    }
    
    private func simulateImpacts(_ space: inout [Int], _ asteroid: Int) {
        while let closestAst = space.last, closestAst > 0, closestAst < abs(asteroid) {
            space.removeLast()
        }
        
        if space.isEmpty || space.last! < 0 {
            space.append(asteroid)
        }
        else if space.last! == abs(asteroid) {
            space.removeLast()
        }
    }
    
}
