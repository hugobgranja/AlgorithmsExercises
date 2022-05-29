//
//  TraverseTree.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/05/2022.
//
//  Given a binary tree of integers t, return its node values in the following format:
//  The first element should be the value of the tree root;
//  The next elements should be the values of the nodes at height 1 (i.e. the root children), ordered from the leftmost to the rightmost one;
//  The elements after that should be the values of the nodes at height 2 (i.e. the children of the nodes at height 1) ordered in the same way;
//  Solve this task without using recursion.
//

import Foundation

class TraverseTree {
    
    func solve(t: TreeNode?) -> [Int] {
        guard let root = t else { return [] }
        var queue = [root]
        var result = [Int]()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node.value)
            if let leftNode = node.left { queue.append(leftNode) }
            if let rightNode = node.right { queue.append(rightNode) }
        }
        
        return result
    }
    
}
