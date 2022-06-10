//
//  FillingBlocks.swift
//  AlgorithmsExercises
//  Created by hg on 21/05/2022.
//
//  Tiling dominoes
//  You have a block with the dimensions 4 × n.
//  Find the number of different ways you can fill this block with smaller blocks that have the dimensions 1 × 2. You are allowed to rotate the smaller blocks.
//  Alt keywords:
//  https://math.stackexchange.com/questions/664113/count-the-ways-to-fill-a-4-times-n-board-with-dominoes
//

import Foundation

class FillingBlocks {
    
    func solve(n: Int) -> Int {
        var memo = [1, 1, 5, 11]
            
        for i in 4...n {
            memo.append(memo[i-1] + 5 * memo[i-2] + memo[i-3] - memo[i-4])
        }
        
        return memo[n]
    }
    
}
