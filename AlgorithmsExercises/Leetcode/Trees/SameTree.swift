//
//  SameTree.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Given the roots of two binary trees p and q, write a function to check if they are the same or not.
//  Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
//

import Foundation

class SameTree {
    
    func solve(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        return p?.value == q?.value && solve(p?.left, q?.left) && solve(p?.right, q?.right)
    }
    
}
