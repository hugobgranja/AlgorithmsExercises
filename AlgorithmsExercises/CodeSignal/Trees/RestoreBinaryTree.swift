//
//  RestoreBinaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 07/05/2022.
//
//  |Construct Binary Tree from Preorder and Inorder Traversal|
//  |Binary Tree|Divide and Conquer|
//  Given the inorder and preorder traversals of a binary tree t, but not t itself, restore t and return it.
//  Your solution should have O(inorder.length) time complexity.
//

import Foundation

class RestoreBinaryTree {
    
    func solve(inorder: [Int], preorder: [Int]) -> TreeNode? {
        let map = inorder.enumerated().reduce(into: [Int: Int]()) { $0[$1.element] = $1.offset }
        return buildTree(map: map, preorder: preorder, index: 0, start: 0, size: preorder.count)
    }
    
    private func buildTree(map: [Int: Int], preorder: [Int], index: Int, start: Int, size: Int) -> TreeNode? {
        guard size > 0 else { return nil }
        
        let nodeValue = preorder[index]
        let node = TreeNode(nodeValue)
        
        if size == 1 { return node }
        
        let leftIndex = index + 1
        let leftStart = start
        let leftSize = map[nodeValue]! - start
        node.left = buildTree(map: map, preorder: preorder, index: leftIndex, start: leftStart, size: leftSize)
        
        let rightIndex = leftIndex + leftSize
        let rightStart = map[nodeValue]! + 1
        let rightSize = size - leftSize - 1
        node.right = buildTree(map: map, preorder: preorder, index: rightIndex, start: rightStart, size: rightSize)
        
        return node
    }
    
}
