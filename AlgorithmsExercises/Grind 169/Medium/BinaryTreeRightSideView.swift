//
//  BinaryTreeRightSideView.swift
//  AlgorithmsExercises
//  Created by hg on 07/06/2022.
//
//  |Binary Tree Right Side View|
//  |Binary Tree|DFS|
//  Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//

import Foundation

class BinaryTreeRightSideView {
    
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var stack = [(root, 0)]
        var result = [Int]()
        
        while let (node, level) = stack.popLast() {
            if result.count == level { result.append(node.val) }
            if let left = node.left { stack.append((left, level + 1)) }
            if let right = node.right { stack.append((right, level + 1)) }
        }
        
        return result
    }
    
}
