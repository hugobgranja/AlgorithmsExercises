//
//  IsSubtree.swift
//  AlgorithmsExercises
//  Created by hg on 07/05/2022.
//
//  |Subtree of Another Tree|
//  |Binary Tree|DFS|
//  Given two binary trees t1 and t2, determine whether the second tree is a subtree of the first tree.
//  A subtree for vertex v in a binary tree t is a tree consisting of v and all its descendants in t.
//  Determine whether or not there is a vertex v (possibly none) in tree t1 such that a subtree for vertex v (possibly empty) in t1 equals t2.
//

import Foundation

class IsSubtree {
    
    func solve(t1: TreeNode?, t2: TreeNode?) -> Bool {
        if t2 == nil { return true }
        if t1 == nil { return false }
        return isEqual(t1: t1, t2: t2) ||
            solve(t1: t1?.left, t2: t2) ||
            solve(t1: t1?.right, t2: t2)
    }

    private func isEqual(t1: TreeNode?, t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil { return true }
        if t1 == nil || t2 == nil { return false }
        return t1?.val == t2?.val &&
            isEqual(t1: t1?.left, t2: t2?.left) &&
            isEqual(t1: t1?.right, t2: t2?.right)
    }
    
}
