//
//  HasPathWithGivenSum.swift
//  AlgorithmsExercises
//
//  Created by hg on 06/05/2022.
//
//  Given a binary tree t and an integer s, determine whether there is a root to leaf path in t such that the sum of vertex values equals s.
//

import Foundation

class HasPathWithGivenSum {
    
    func solve(t: Tree<Int>?, s: Int) -> Bool {
        guard let someNode = t else { return false }
            
        if someNode.left == nil && someNode.right == nil {
            return someNode.value == s
        }
        
        let newSum = s - someNode.value
        return solve(t: someNode.left, s: newSum) || solve(t: someNode.right, s: newSum)
    }
    
}
