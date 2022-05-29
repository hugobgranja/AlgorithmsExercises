//
//  DeleteFromBST.swift
//  AlgorithmsExercises
//
//  Created by hg on 17/05/2022.
//

import Foundation

class DeleteFromBST {
    
    func solve(t: TreeNode?, queries: [Int]) -> TreeNode? {
        var root = t
                
        for key in queries {
            root = delete(key: key, node: root)
        }
        
        return root
    }

    private func delete(key: Int, node: TreeNode?) -> TreeNode? {
        guard var someNode = node else { return nil }
        if key < someNode.value { someNode.left = delete(key: key, node: someNode.left) }
        else if key > someNode.value { someNode.right = delete(key: key, node: someNode.right) }
        else {
            if let someLeft = someNode.left {
                let auxNode = someNode
                someNode = max(node: someLeft)
                someNode.left = deleteMax(node: auxNode.left)
                someNode.right = auxNode.right
            }
            else {
                return someNode.right
            }
        }
        
        return someNode
    }

    private func max(node: TreeNode) -> TreeNode {
        var node = node
        while let someNode = node.right { node = someNode }
        return node
    }

    private func deleteMax(node: TreeNode?) -> TreeNode? {
        guard let someNode = node else { return nil }
        if someNode.right == nil { return someNode.left }
        someNode.right = deleteMax(node: someNode.right)
        return someNode
    }


    
}
