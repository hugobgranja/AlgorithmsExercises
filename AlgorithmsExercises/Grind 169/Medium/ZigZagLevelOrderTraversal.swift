//
//  ZigZagLevelOrderTraversal.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Binary Tree Zig Zag Level Order Traversal|
//  |Binary Tree|BFS|
//  Given the root of a binary tree, return the zigzag level order traversal of its nodes' values.
//

import Foundation

class ZigZagLevelOrderTraversal {
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var queue = [root]
        var result = [[Int]]()
        var isLeftToRight = true
        
        while !queue.isEmpty {
            let zigZagQueue = isLeftToRight ? queue : queue.reversed()
            var level = [Int]()
            var newQueue = [TreeNode]()
            
            for (node, znode) in zip(queue, zigZagQueue) {
                level.append(znode.val)
                if let left = node.left { newQueue.append(left) }
                if let right = node.right { newQueue.append(right) }
            }
            
            result.append(level)
            queue = newQueue
            isLeftToRight.toggle()
        }
        
        return result
    }
    
}
