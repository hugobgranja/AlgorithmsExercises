//
//  InorderSuccessorBST.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Inorder Successor in BST|
//  |BST|DFS|
//  Given a binary search tree and a node in it, find the in-order successor of that node in the BST.
//  If the given node has no in-order successor in the tree, return null.
//

import Foundation

class InorderSuccessorBST {
    
    func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode) -> TreeNode? {
        guard let root = root else { return nil }
        
        if root.val <= p.val {
            return inorderSuccessor(root.right, p)
        }
        
        return inorderSuccessor(root.left, p) ?? root
    }
    
}
