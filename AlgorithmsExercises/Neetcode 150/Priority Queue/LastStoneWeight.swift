//
//  LastStoneWeight.swift
//  AlgorithmsExercises
//  Created by hg on 11/07/2022.
//
//  |Last Stone Weight|
//  |Priority Queue|
//  You are given an array of integers stones where stones[i] is the weight of the ith stone.
//  We are playing a game with the stones.
//  On each turn, we choose the heaviest two stones and smash them together.
//  Suppose the heaviest two stones have weights x and y with x <= y.
//  The result of this smash is:
//  If x == y, both stones are destroyed, and
//  If x != y, the stone of weight x is destroyed, and the stone of weight y has new weight y - x.
//  At the end of the game, there is at most one stone left.
//  Return the weight of the last remaining stone. If there are no stones left, return 0.
//

import Foundation
import SwiftAlgorithms

class LastStoneWeight {
    
    func lastStoneWeight(_ stones: [Int]) -> Int {
        let pq = BinaryHeap<Int> { $0 < $1 }
        for stone in stones { pq.enqueue(stone) }
        
        while pq.count > 1 {
            let s1 = pq.dequeue()!
            let s2 = pq.dequeue()!
            
            if s1 > s2 {
                pq.enqueue(s1 - s2)
            }
        }
        
        return pq.dequeue() ?? 0
    }
    
}
