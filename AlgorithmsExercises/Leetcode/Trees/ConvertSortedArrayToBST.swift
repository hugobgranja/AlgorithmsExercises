//
//  ConvertSortedArrayToBST.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/05/2022.
//
//  Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.
//  A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.
//
//  Other topics: Divide and conquer
//

import Foundation

class ConvertedSortedArrayToBST {
    
    func solve<T: RandomAccessCollection>(_ nums: T) -> TreeNode? where T.Index == Int, T.Element == Int {
        if nums.isEmpty { return nil }
        if nums.count == 1 { return TreeNode(nums.first!) }
        
        let mid = nums.startIndex + (nums.endIndex - nums.startIndex) / 2
        
        return TreeNode(
            nums[mid],
            solve(nums.prefix(upTo: mid)),
            solve(nums.suffix(from: mid + 1))
        )
    }
    
}
