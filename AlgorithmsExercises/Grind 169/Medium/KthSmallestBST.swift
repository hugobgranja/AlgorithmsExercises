//
//  KthSmallestBST.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//
//  |Kth Smallest Element in a BST|
//  |BST|DFS|
//  Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
//  Follow up: If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
//  Answer: Add size to nodes (Order-statistic tree)
//

import Foundation

class KthSmallestBST {
    
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var currentNode = root
        var currentSmallest = 0
        
        while currentNode != nil || !stack.isEmpty {
            while let someNode = currentNode {
                stack.append(someNode)
                currentNode = someNode.left
            }
            
            currentNode = stack.popLast()
            currentSmallest += 1
            
            if currentSmallest == k {
                return currentNode!.val
            }
            
            currentNode = currentNode?.right
        }
        
        return -1
    }
    
}
