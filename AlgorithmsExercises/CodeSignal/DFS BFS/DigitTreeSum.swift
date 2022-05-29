//
//  DigitTreeSum.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/05/2022.
//
//  We're going to store numbers in a tree.
//  Each node in this tree will store a single digit (from 0 to 9), and each path from root to leaf encodes a non-negative integer.
//  Given a binary tree t, find the sum of all the numbers encoded in it.
//

import Foundation

class DigitTreeSum {
    
    func solve(t: TreeNode?) -> Int64 {
        guard let root = t else { return 0 }
        return solve(t: root, number: Int64(root.value))
    }
    
    private func solve(t: TreeNode, number: Int64) -> Int64 {
        var sum: Int64?
        
        if let leftNode = t.left {
            sum = solve(t: leftNode, number: Int64(leftNode.value) + number * 10)
        }
        
        if let rightNode = t.right {
            sum = (sum ?? 0) + solve(t: rightNode, number: Int64(rightNode.value) + number * 10)
        }
        
        return sum ?? number
    }
    
}
