//
//  MaximumWidthBinaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 14/06/2022.
//
//  |Maximum Width of Binary Tree|
//  |Binary Tree|BFS|Overflow|
//  Given the root of a binary tree, return the maximum width of the given tree.
//  The maximum width of a tree is the maximum width among all levels.
//  The width of one level is defined as the length between the end-nodes (the leftmost and rightmost non-null nodes), where the null nodes between the end-nodes that would be present in a complete binary tree extending down to that level are also counted into the length calculation.
//  It is guaranteed that the answer will in the range of a 32-bit signed integer.
//

import Foundation

class MaximumWidthBinaryTree {
    
    private typealias IndexedNode = (node: TreeNode, index: Int)
    
    // Causes overflow
    func widthOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 1 }
        var levelNodes: [IndexedNode] = [(root, 0)]
        var maxWidth = 1
        
        while !levelNodes.isEmpty {
            let leftIndex = levelNodes.first!.index
            let rightIndex = levelNodes.last!.index
            var newLevel = [IndexedNode]()
            maxWidth = max(maxWidth, rightIndex - leftIndex + 1)
            
            for (node, parentIndex) in levelNodes {
                if let left = node.left {
                    newLevel.append((left, 2 * parentIndex))
                }
                if let right = node.right {
                    newLevel.append((right, 2 * parentIndex + 1))
                }
            }
            
            levelNodes = newLevel
        }
        
        return maxWidth
    }
    
    // The trick here to avoid overflow is to reset tree indices if there's nothing to the left
    // Basically treating the new level as if we had just started there
    // The amount by which we can reset is the index of the leftmost node we currently have
    func widthOfBinaryTree2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 1 }
        var levelNodes: [IndexedNode] = [(root, 0)]
        var maxWidth = 1
        
        while !levelNodes.isEmpty {
            let leftIndex = levelNodes.first!.index
            let rightIndex = levelNodes.last!.index
            var newLevel = [IndexedNode]()
            maxWidth = max(maxWidth, rightIndex - leftIndex + 1)
            
            for (node, parentIndex) in levelNodes {
                if let left = node.left {
                    newLevel.append((left, 2 * parentIndex - leftIndex))
                }
                if let right = node.right {
                    newLevel.append((right, 2 * parentIndex + 1 -  leftIndex))
                }
            }
            
            levelNodes = newLevel
        }
        
        return maxWidth
    }
    
}
