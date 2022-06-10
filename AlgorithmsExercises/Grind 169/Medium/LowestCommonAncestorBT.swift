//
//  LowestCommonAncestorBT.swift
//  AlgorithmsExercises
//  Created by hg on 03/06/2022.
//
//  |Lowest Common Ancestor of a Binary Tree|
//  |Binary Tree|DFS|
//  Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
//

import Foundation

class LowestCommonAncestorBT {
 
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        if root == nil || root === p || root === q { return root }
        
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        
        if left == nil { return right }
        else if right == nil { return left }
        else { return root }
    }
    
}
