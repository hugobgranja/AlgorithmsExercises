//
//  Tree.swift
//  AlgorithmsExercises
//  Created by hg on 06/05/2022.
//

import Foundation
import SwiftAlgorithms

class TreeNode {

    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    init(_ value: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = value
        self.left = left
        self.right = right
    }
    
    init?(_ elements: [Int?]) {
        guard case let .some(.some(firstValue)) = elements.first else { return nil }
        self.val = firstValue
        
        let queue = TwoStackQueue<TreeNode>()
        queue.enqueue(self)
        var index = 1
        
        while let node = queue.dequeue(), index < elements.count {
            if elements.indices.contains(index), let value = elements[index] {
                let newNode = TreeNode(value)
                node.left = newNode
                queue.enqueue(newNode)
            }
            
            index += 1
            if index >= elements.count { break }
            
            if elements.indices.contains(index), let value = elements[index] {
                let newNode = TreeNode(value)
                node.right = newNode
                queue.enqueue(newNode)
            }
            
            index += 1
        }
    }
    
    func printLevelOrder() {
        var nodes = [self]
        
        while !nodes.isEmpty {
            var newNodes = [TreeNode]()
            
            for node in nodes {
                print(node.val)
                if let left = node.left { newNodes.append(left) }
                if let right = node.right { newNodes.append(right) }
            }
            
            nodes = newNodes
        }
    }
    
}

