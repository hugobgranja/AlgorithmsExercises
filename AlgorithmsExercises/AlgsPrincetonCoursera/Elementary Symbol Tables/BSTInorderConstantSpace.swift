//
//  InorderConstantSpace.swift
//  AlgorithmsExercises
//  Created by hg on 01/01/2021.
//
//  Inorder traversal with constant extra space.
//  Design an algorithm to perform an inorder traversal of a binary search tree using only a constant amount of extra space.
//

import Foundation
import SwiftAlgorithms

class BSTInorderConstantSpace {
    
    func inorder<Key,Value>(bst: BinarySearchTreeImpl<Key,Value>, function: @escaping (Value) -> Void) {
        var currentNode = bst.root
         
        while let someNode = currentNode {
            if someNode.left == nil {
                function(someNode.value)
                currentNode = someNode.right
            }
            else {
                var previousNode = someNode.left
                
                while let rightPreviousNode = previousNode?.right, rightPreviousNode.key != someNode.key {
                    previousNode = rightPreviousNode
                }
     
                if previousNode?.right == nil {
                    previousNode?.right = currentNode
                    currentNode = someNode.left
                }
                else {
                    previousNode?.right = nil
                    function(someNode.value)
                    currentNode = someNode.right
                }
            }
        }
    }
    
}

