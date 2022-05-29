//
//  IsTreeSymmetric.swift
//  AlgorithmsExercises
//
//  Created by hg on 06/05/2022.
//
//  Given a binary tree t, determine whether it is symmetric around its center, i.e. each side mirrors the other.
//

import Foundation

class IsTreeSymmetric {
    
    func solve(t: TreeNode?) -> Bool {
        return isEqual(left: t?.left, right: t?.right)
    }
    
    private func isEqual(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        return left?.value == right?.value &&
            isEqual(left: left?.left, right: right?.right) &&
            isEqual(left: left?.right, right: right?.left)
    }
    
}
