//
//  LargestValuesInTreeRows.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/05/2022.
//
//  You have a binary tree t.
//  Your task is to find the largest value in each row of this tree.
//  In a tree, a row is a set of nodes that have equal depth.
//  For example, a row with depth 0 is a tree root, a row with depth 1 is composed of the root's children, etc.
//  Return an array in which the first element is the largest value in the row with depth 0, the second element is the largest value in the row with depth 1, the third element is the largest element in the row with depth 2, etc.
//

import Foundation

class LargestValuesInTreeRows {
    
    func solve(t: Tree<Int>?) -> [Int] {
        guard let root = t else { return [] }
        var nodes = [root]
        var result = [Int]()
        
        while let first = nodes.first {
            var nextNodes = [Tree<Int>]()
            var maxValue = first.value
            
            for node in nodes {
                if node.value > maxValue { maxValue = node.value }
                if let leftNode = node.left { nextNodes.append(leftNode) }
                if let rightNode = node.right { nextNodes.append(rightNode) }
            }
            
            result.append(maxValue)
            nodes = nextNodes
        }
        
        return result
    }
    
}
