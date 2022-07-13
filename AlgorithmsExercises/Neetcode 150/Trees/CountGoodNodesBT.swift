//
//  CountGoodNodesBT.swift
//  AlgorithmsExercises
//  Created by hg on 11/07/2022.
//
//  |Count Good Nodes in Binary Tree|
//  |Binary Tree|DFS|
//  Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.
//  Return the number of good nodes in the binary tree.
//

import Foundation

class CountGoodNodesBT {
    
    func goodNodes(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?, _ maxVal: Int) -> Int {
            guard let node = node else { return 0 }
            let newMax = max(maxVal, node.val)
            return (node.val >= maxVal ? 1 : 0) + dfs(node.left, newMax) + dfs(node.right, newMax)
        }
        
        return dfs(root, Int.min)
    }
    
}
