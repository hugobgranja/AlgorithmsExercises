//
//  MaxDepthBinaryTree.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Given the root of a binary tree, return its maximum depth.
//  A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//

import Foundation

class MaxDepthBinaryTree {
    
    func solve(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + max(solve(root.left), solve(root.right))
    }
    
}
