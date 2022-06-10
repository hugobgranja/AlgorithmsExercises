//
//  MaximumPathSumBT.swift
//  AlgorithmsExercises
//  Created by hg on 03/07/2022.
//
//  |Binary Tree Maximum Path Sum|
//  |Binary Tree|DFS|
//  A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them.
//  A node can only appear in the sequence at most once.
//  Note that the path does not need to pass through the root.
//  The path sum of a path is the sum of the node's values in the path.
//  Given the root of a binary tree, return the maximum path sum of any non-empty path.
//

import Foundation

class MaximumPathSumBT {
    
    // Calculate max path sum from bottom to top
    // Consider two cases:
    // Add left and right children - We can't consider further nodes above the parent
    // Add one children - Can continue adding the nodes above
    func maxPathSum(_ root: TreeNode?) -> Int {
        @discardableResult
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftMaxSum = max(dfs(node.left), 0)
            let rightMaxSum = max(dfs(node.right), 0)
            let splitSum = node.val + leftMaxSum + rightMaxSum
            maxSum = max(maxSum, splitSum)
            return node.val + max(leftMaxSum, rightMaxSum)
        }
        
        var maxSum = root?.val ?? 0
        dfs(root)
        return maxSum
    }
    
}
