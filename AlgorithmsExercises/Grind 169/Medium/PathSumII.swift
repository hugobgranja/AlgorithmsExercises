//
//  PathSumII.swift
//  AlgorithmsExercises
//  Created by hg on 12/06/2022.
//
//  |Path Sum II|
//  |Binary Tree|
//  Given the root of a binary tree and an integer targetSum, return all root-to-leaf paths where the sum of the node values in the path equals targetSum.
//  Each path should be returned as a list of the node values, not node references.
//  A root-to-leaf path is a path starting from the root and ending at any leaf node.
//  A leaf is a node with no children.
//

import Foundation

class PathSumII {
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        func dfs(_ node: TreeNode?, _ targetSum: Int) {
            guard let someNode = node else { return }
            
            path.append(someNode.val)
                
            if isLeaf(someNode) && targetSum == someNode.val {
                result.append(path)
            }
            else {
                let newSum = targetSum - someNode.val
                dfs(someNode.left, newSum)
                dfs(someNode.right, newSum)
            }
            
            path.removeLast()
        }
        
        var result = [[Int]]()
        var path = [Int]()
        dfs(root, targetSum)
        return result
    }
    
    private func isLeaf(_ node: TreeNode) -> Bool {
        return node.left == nil && node.right == nil
    }
    
}
