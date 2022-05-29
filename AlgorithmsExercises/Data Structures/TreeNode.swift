//
//  Tree.swift
//  AlgorithmsExercises
//
//  Created by hg on 06/05/2022.
//

import Foundation

class TreeNode {

    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init() {
        self.value = 0
        self.left = nil
        self.right = nil
    }
    
    init(_ value: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
 }
