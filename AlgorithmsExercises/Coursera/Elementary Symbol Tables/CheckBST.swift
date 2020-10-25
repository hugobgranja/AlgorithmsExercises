//
//  CheckBST.swift
//  AlgorithmsExercises
//
//  Created by hg on 01/01/2021.
//
//  Check if a binary tree is a BST.
//  Given a binary tree where each Node contains a key, determine whether it is a binary search tree.
//  Use extra space proportional to the height of the tree.
//

import Foundation
import SwiftAlgorithms

class CheckBST {
    
    func isBST<Key,Value>(_ bst: BinarySearchTreeImpl<Key,Value>) -> Bool {
        guard let root = bst.root else { return true }
        let isLeftBST = isBST(node: root.left, minKey: nil, maxKey: root.key)
        let isRightBST = isBST(node: root.right, minKey: root.key, maxKey: nil)
        return isLeftBST && isRightBST
    }
    
    private func isBST<Key,Value>(node: TreeNode<Key,Value>?, minKey: Key?, maxKey: Key?) -> Bool {
        guard let someNode = node else { return true }
        if let minKey = minKey, someNode.key < minKey { return false }
        if let maxKey = maxKey, someNode.key > maxKey { return false }
        let isLeftBST = isBST(node: node?.left, minKey: minKey, maxKey: someNode.key)
        let isRightBST = isBST(node: node?.right, minKey: someNode.key, maxKey: maxKey)
        return isLeftBST && isRightBST
    }
    
}
