//
//  BSTLevelTraversal.swift
//  AlgorithmsExercises
//
//  Created by hg on 30/05/2022.
//
//  Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
//

import Foundation

class BinaryTreeLevelTraversal {
    
    func solve(_ root: TreeNode?) -> [[Int]] {
        var queue = [(root, 0)]
        var result = [[Int]]()
        
        while let (node, level) = queue.first {
            queue.removeFirst()
            guard let node = node else { continue }
            
            if result.indices.contains(level) {
                result[level].append(node.value)
            }
            else {
                result.append([node.value])
            }
            
            queue.append((node.left, level + 1))
            queue.append((node.right, level + 1))
        }
        
        return result
    }
    
    func solve2(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [[Int]]()
        
        while !queue.isEmpty {
            var level = [Int]()
            
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.value)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            
            result.append(level)
        }
        
        return result
    }
    
}
