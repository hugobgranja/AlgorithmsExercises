//
//  PathSumIII.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Path Sum III|
//  |Binary Tree|DFS|
//  Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.
//  The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).
//

import Foundation

class PathSumIII {
    
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        func dfs(_ node: TreeNode?, _ sums: [Int]) {
            guard let node = node else { return }
            
            var newSums = [0]
            
            for val in sums {
                let newSum = val + node.val
                newSums.append(newSum)
                if newSum == targetSum { result += 1 }
            }
            
            dfs(node.left, newSums)
            dfs(node.right, newSums)
        }
        
        var result = 0
        dfs(root, [0])
        return result
    }
    
    func pathSum2(_ root: TreeNode?, _ targetSum: Int) -> Int {
        func dfs(_ node: TreeNode?, _ sums: [Int]) -> Int {
            guard let node = node else { return 0 }
            
            var count = 0
            var newSums = [0]
            
            for val in sums {
                let newSum = val + node.val
                newSums.append(newSum)
                if newSum == targetSum { count += 1 }
            }
            
            return count + dfs(node.left, newSums) + dfs(node.right, newSums)
        }
        
        return dfs(root, [0])
    }
    
    func pathSum3(_ root: TreeNode?, _ targetSum: Int) -> Int {
        func dfs(_ node: TreeNode?, _ targetSum: Int) -> Int {
            guard let node = node else { return 0 }
            let newSum = targetSum - node.val
            return (targetSum == node.val ? 1 : 0) + dfs(node.left, newSum) + dfs(node.right, newSum)
        }
        
        guard let root = root else { return 0 }
        return dfs(root, targetSum) + pathSum3(root.left, targetSum) + pathSum3(root.right, targetSum)
    }
    
}
