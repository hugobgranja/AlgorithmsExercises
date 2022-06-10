//
//  MinimumKnightMoves.swift
//  AlgorithmsExercises
//  Created by hg on 16/06/2022.
//
//  |Minimum Knight Moves|
//  |BFS|
//  In an infinite chess board with coordinates from -infinity to +infinity, you have a knight at square [0, 0].
//  A knight has 8 possible moves it can make.
//  Each move is two squares in a cardinal direction, then one square in an orthogonal direction.
//  Return the minimum number of steps needed to move the knight to the square [x, y]. It is guaranteed the answer exists.
//

import Foundation

class MinimumKnightMoves {
    
    struct Coordinate: Hashable {
        let row: Int
        let col: Int
    }
    
    // Start from (x,y) and try to get to starting cases
    // Check only the positive quadrant since distance to other quadrants is equal to positive quadrant
    // (0, 2), (1, 1), (2, 0) are the cases that requires stepping out of the positive quadrant to reach
    // O(xy) time, O(xy) space
    func minKnightMoves(_ x: Int, _ y: Int) -> Int {
        func dp(_ x: Int, _ y: Int) -> Int {
            if x + y == 0 { return 0 }  // (0, 0)
            if x + y == 2 { return 2 }  // (0, 2), (1, 1), (2, 0)
            
            let key = Coordinate(row: x, col: y)
            if let memoized = memo[key] { return memoized }
            
            let minMove = min(dp(abs(x - 2), abs(y - 1)), dp(abs(x - 1), abs(y - 2))) + 1
            memo[key] = minMove
            return minMove
        }
        
        var memo = [Coordinate: Int]()
        return dp(abs(x), abs(y))
    }
    
}
