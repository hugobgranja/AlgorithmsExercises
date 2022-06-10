//
//  BalancedBinaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 26/05/2022.
//
//  |Balanced Binary Tree|
//  |Binary Tree|DFS|
//  Given a binary tree, determine if it is height-balanced.
//  For this problem, a height-balanced binary tree is defined as:
//  A binary tree in which the left and right subtrees of every node differ in height by no more than 1.
//

import Foundation

class BalancedBinaryTree {
    
    func solve(_ root: TreeNode?) -> Bool {
        return solveAux(root).0
    }
    
    private func solveAux(_ node: TreeNode?) -> (Bool, Int) {
        guard let node = node else { return (true, 0) }
        
        let (leftIsBalanced, leftHeight) = solveAux(node.left)
        let (rightIsBalanced, rightHeight) = solveAux(node.right)
        
        return (
            leftIsBalanced && rightIsBalanced && abs(leftHeight - rightHeight) <= 1,
            leftHeight + rightHeight + 1
        )
    }
    
}
