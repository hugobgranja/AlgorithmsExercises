//
//  ValidateBST.swift
//  AlgorithmsExercises
//  Created by hg on 31/05/2022.
//
//  |Validate Binary Search Tree|
//  |BST|DFS|
//  Given the root of a binary tree, determine if it is a valid binary search tree (BST).
//  A valid BST is defined as follows:
//  The left subtree of a node contains only nodes with keys less than the node's key.
//  The right subtree of a node contains only nodes with keys greater than the node's key.
//  Both the left and right subtrees must also be binary search trees.
//

import Foundation

class ValidateBST {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        let isLeftBST = isBST(node: root.left, minKey: nil, maxKey: root.val)
        let isRightBST = isBST(node: root.right, minKey: root.val, maxKey: nil)
        return isLeftBST && isRightBST
    }
    
    private func isBST(node: TreeNode?, minKey: Int?, maxKey: Int?) -> Bool {
        guard let someNode = node else { return true }
        if let minKey = minKey, someNode.val <= minKey { return false }
        if let maxKey = maxKey, someNode.val >= maxKey { return false }
        let isLeftBST = isBST(node: node?.left, minKey: minKey, maxKey: someNode.val)
        let isRightBST = isBST(node: node?.right, minKey: someNode.val, maxKey: maxKey)
        return isLeftBST && isRightBST
    }
    
}
