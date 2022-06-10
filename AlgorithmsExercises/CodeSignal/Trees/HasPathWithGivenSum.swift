//
//  HasPathWithGivenSum.swift
//  AlgorithmsExercises
//  Created by hg on 06/05/2022.
//
//  |Path Sum|
//  |Binary Tree|DFS|
//  Given a binary tree t and an integer s, determine whether there is a root to leaf path in t such that the sum of vertex values equals s.
//

import Foundation

class HasPathWithGivenSum {
    
    func solve(t: TreeNode?, s: Int) -> Bool {
        guard let someNode = t else { return false }
            
        if someNode.left == nil && someNode.right == nil {
            return someNode.val == s
        }
        
        let newSum = s - someNode.val
        return solve(t: someNode.left, s: newSum) || solve(t: someNode.right, s: newSum)
    }
    
}
