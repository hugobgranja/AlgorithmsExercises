//
//  MaximumDepthNaryTree.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//
//  Given a n-ary tree, find its maximum depth.
//  The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//

import Foundation

class MaximumDepthNaryTree {
    
    func maxDepth(_ root: NaryTreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var maxAtRoot = 1
        
        for child in root.children {
            maxAtRoot = max(maxAtRoot, maxDepth(child) + 1)
        }
        
        return maxAtRoot
    }
    
}
