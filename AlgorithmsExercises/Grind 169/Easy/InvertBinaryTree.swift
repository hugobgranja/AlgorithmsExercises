//
//  InvertBinaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//
//  |Invert Binary Tree|
//  |Binary Tree|DFS|BFS|
//  Given the root of a binary tree, invert the tree, and return its root.
//

import Foundation

class InvertBinaryTree {
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let right = root.right
        root.right = invertTree(root.left)
        root.left = invertTree(right)
        return root
    }
    
    func invertTreeIt(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var stack = [root]
        
        while let node = stack.popLast() {
            let right = node.right
            node.right = node.left
            node.left = right
            
            if let left = node.left { stack.append(left) }
            if let right = node.right { stack.append(right) }
        }
        
        return root
    }
    
}
