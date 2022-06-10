//
//  SerializeDeserializeBT.swift
//  AlgorithmsExercises
//  Created by hg on 25/06/2022.
//
//  |Serialize and Deserialize Binary Tree|
//  |Binary Tree|DFS|BFS|Design|
//  Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
//  Design an algorithm to serialize and deserialize a binary tree.
//  There is no restriction on how your serialization/deserialization algorithm should work.
//  You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
//  Clarification: The input/output format is the same as how LeetCode serializes a binary tree.
//  You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
//

import Foundation

class SerializeDeserializeBT {
    
    func serializePreorder(_ root: TreeNode?) -> String {
        func dfs(_ node: TreeNode?) -> String {
            guard let node = node else { return "N" }
            return "\(node.val)" + "," + dfs(node.left) + "," + dfs(node.right)
        }
        
        return dfs(root)
    }
    
    func deserializePreorder(_ data: String) -> TreeNode? {
        func dfs() -> TreeNode? {
            guard values[index] != "N" else {
                index += 1
                return nil
            }
            
            let val = Int(values[index])!
            let newNode = TreeNode(val)
            index += 1
            newNode.left = dfs()
            newNode.right = dfs()
            return newNode
        }
        
        let values = data.split(separator: ",")
        var index = 0
        return dfs()
    }
    
    func serializeLevel(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }
        var queue: [TreeNode?] = [root]
        var result = ""
        
        while !queue.isEmpty {
            var newQueue = [TreeNode?]()
            
            for node in queue {
                if let node = node {
                    result += "\(node.val),"
                    newQueue.append(node.left)
                    newQueue.append(node.right)
                }
                else {
                    result += "N,"
                }
            }
            
            queue = newQueue
        }
        
        return result
    }
    
    func deserializeLevel(_ data: String) -> TreeNode? {
        let values = data.split(separator: ",")
        guard let firstVal = values.first else { return nil }
        let root = TreeNode(Int(firstVal)!)
        var queue = [root]
        
        for index in stride(from: 1, to: values.endIndex, by: 2) {
            let node = queue.removeFirst()
            
            if values[index] != "N" {
                let val = Int(values[index])!
                let newNode = TreeNode(val)
                node.left = newNode
                queue.append(newNode)
            }
            
            if values[index + 1] != "N" {
                let val = Int(values[index + 1])!
                let newNode = TreeNode(val)
                node.right = newNode
                queue.append(newNode)
            }
        }
        
        return root
    }
    
}
