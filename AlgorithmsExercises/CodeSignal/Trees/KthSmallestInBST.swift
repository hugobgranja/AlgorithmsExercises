//
//  KthSmallestInBST.swift
//  AlgorithmsExercises
//
//  Created by hg on 07/05/2022.
//
//  A tree is considered a binary search tree (BST) if for each of its nodes the following is true:
//  The left subtree of a node contains only nodes with keys less than the node's key.
//  The right subtree of a node contains only nodes with keys greater than the node's key.
//  Both the left and the right subtrees must also be binary search trees.
//  Given a binary search tree t, find the kth smallest element in it.
//  Note that kth smallest element means kth element in increasing order. See examples for better understanding.
//  Your solution should have only one BST traversal and O(1) extra space complexity.
//

import Foundation

class KthSmallestInBST {
    
    // Morris inorder traversal
    func solve(t: TreeNode?, k: Int) -> Int? {
        var currentNode = t
        var prevNode: TreeNode?
        var rank = 0
  
        while let someNode = currentNode {
            if someNode.left == nil {
                rank += 1
                if rank == k { return someNode.value }
                currentNode = someNode.right
            }
            else {
                prevNode = someNode.left
                
                while prevNode?.right != nil && prevNode?.right !== someNode {
                    prevNode = prevNode?.right
                }
                
                if prevNode?.right == nil {
                    prevNode?.right = someNode
                    currentNode = currentNode?.left
                }
                else {
                    prevNode?.right = nil
                    rank += 1
                    if rank == k { return someNode.value }
                    currentNode = currentNode?.right
                }
            }
        }
        
        return nil
    }
    
}
