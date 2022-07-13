//
//  WallsAndGates.swift
//  AlgorithmsExercises
//  Created by hg on 18/07/2022.
//
//  |Walls and Gates|
//  |Matrix|BFS|
//  You are given a m x n 2D grid initialized with these three possible values.
//  -1 - A wall or an obstacle.
//  0 - A gate.
//  INF - Infinity means an empty room. We use the value 2^31 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
//  Fill each empty room with the distance to its nearest gate. If it is impossible to reach a Gate, that room should remain filled with INF
//

import Foundation
import SwiftAlgorithms

class WallsAndGates {
    
    private struct Coordinate: Hashable {
        var row: Int
        var col: Int
    }
    
    private let emptyRoom = Int(Int32.max)
    
    // Multiple source BFS
    func wallsAndGates(_ rooms: inout [[Int]]) {
        let queue = TwoStackQueue<Coordinate>()
        
        for (rowIndex, row) in rooms.enumerated() {
            for (colIndex, col) in row.enumerated() {
                if col == 0 {
                    let coordinate = Coordinate(row: rowIndex, col: colIndex)
                    queue.enqueue(coordinate)
                }
            }
        }
        
        while let currentRoom = queue.dequeue() {
            for nextRoom in adjacentTo(rooms, currentRoom) {
                if isTraversable(rooms, nextRoom) {
                    rooms[nextRoom.row][nextRoom.col] = rooms[currentRoom.row][currentRoom.col] + 1
                    queue.enqueue(nextRoom)
                }
            }
        }
    }
    
    private func adjacentTo(_ grid: [[Int]], _ coordinate: Coordinate) -> [Coordinate] {
        let row = coordinate.row
        let col = coordinate.col
        return [(row - 1, col), (row, col - 1), (row, col + 1), (row + 1, col)]
            .map { Coordinate(row: $0.0, col: $0.1) }
    }
    
    private func isTraversable(_ grid: [[Int]], _ coordinate: Coordinate) -> Bool {
        let row = coordinate.row
        let col = coordinate.col
        return (0..<grid.count).contains(row) &&
            (0..<grid[0].count).contains(col) &&
            grid[row][col] == emptyRoom
    }
    
}
