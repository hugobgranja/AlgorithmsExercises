//
//  AllNodesDistanceKinBT.swift
//  AlgorithmsExercises
//  Created by hg on 19/06/2022.
//
//  |All Nodes Distance K in BT|
//  |Binary Tree|DFS|
//  Given the root of a binary tree, the value of a target node target, and an integer k, return an array of the values of all nodes that have a distance k from the target node.
//  You can return the answer in any order.
//

import Foundation
import SwiftAlgorithms

class AllNodesDistanceKinBT {
    
    func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ k: Int) -> [Int] {
        func subtreeAdd(_ node: TreeNode?, _ distance: Int) {
            guard let node = node else { return }
            
            if distance == k {
                result.append(node.val)
            }
            else {
                subtreeAdd(node.left, distance + 1)
                subtreeAdd(node.right, distance + 1)
            }
        }
        
        @discardableResult
        func dfs(_ node: TreeNode?) -> Int {
            guard let node = node else { return -1 }
            
            if node === target {
                subtreeAdd(node, 0)
                return 1
            }
            else {
                let left = dfs(node.left)
                let right = dfs(node.right)
                
                if left != -1 {
                    if left == k { result.append(node.val) }
                    subtreeAdd(node.right, left + 1)
                    return left + 1
                }
                else if right != -1 {
                    if right == k { result.append(node.val) }
                    subtreeAdd(node.left, right + 1)
                    return right + 1
                }
                else {
                    return -1
                }
            }
        }
        
        var result = [Int]()
        dfs(root)
        return result
    }
    
}
