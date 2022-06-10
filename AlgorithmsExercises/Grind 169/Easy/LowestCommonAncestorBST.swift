//
//  LowestCommonAncestorBST.swift
//  AlgorithmsExercises
//  Created by hg on 25/05/2022.
//
//  |Lowest Common Ancestor of a Binary Search Tree|
//  |BST|DFS|DFS|
//  Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST.
//  The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).
//

import Foundation

class LowestCommonAncestorBST {
    
    func solve(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let p = p, let q = q else { return nil }
        var node = root
        
        while let someNode = node {
            if p.val < someNode.val && q.val < someNode.val {
                node = someNode.left
            }
            else if p.val > someNode.val && q.val > someNode.val {
                node = someNode.right
            }
            else {
                return someNode
            }
        }
        
        return nil
    }
    
    func solveRec(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else {
            return nil
        }

        if p.val < root.val && q.val < root.val {
            return solveRec(root.left, p, q)
        }
        else if p.val > root.val && q.val > root.val {
            return solveRec(root.right, p, q)
        }
        else {
            return root
        }
    }
    
}
