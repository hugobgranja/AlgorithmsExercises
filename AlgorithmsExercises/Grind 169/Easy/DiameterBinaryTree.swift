//
//  DiameterBinaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 27/05/2022.
//
//  |Diameter of Binary Tree|
//  |Binary Tree|DFS|
//  Given the root of a binary tree, return the length of the diameter of the tree.
//  The diameter of a binary tree is the length of the longest path between any two nodes in a tree.
//  This path may or may not pass through the root.
//  The length of a path between two nodes is represented by the number of edges between them.
//

import Foundation

class DiameterBinaryTree {
    
    func solve(_ root: TreeNode?) -> Int {
        var res = 0
        
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return -1 }
            
            let left = dfs(node.left)
            let right = dfs(node.right)
            res = max(res, 2 + left + right)
            
            return 1 + max(left, right)
        }
        
        _ = dfs(root)
        return res
    }
    
}
