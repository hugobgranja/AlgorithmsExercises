//
//  ReverseNodesInKGroups.swift
//  AlgorithmsExercises
//
//  Created by hg on 02/05/2022.
//
//  Given a linked list l, reverse its nodes k at a time and return the modified list.
//  k is a positive integer that is less than or equal to the length of l.
//  If the number of nodes in the linked list is not a multiple of k, then the nodes that are left out at the end should remain as-is.
//  You may not alter the values in the nodes - only the nodes themselves can be changed.
//  Note: Your solution should have O(n) time complexity, where n is the number of elements in l, and O(1) additional space complexity.
//
//  Example
//  For l = [1, 2, 3, 4, 5] and k = 2, the output should be
//  solution(l, k) = [2, 1, 4, 3, 5]
//

import Foundation

class ReverseNodesInKGroups {
    
    func solve(l: LinkedList<Int>, k: Int) {
        guard k > 1 else { return }
        let length = length(list: l)
        let reverses = length / k
        
        var prev: LinkedList<Int>.Node<Int>?
        var current = l.firstNode
        var i = 0
        
        while let someNode = current, i < reverses {
            let reversedNode = reverse(node: someNode, k: k)
            if i == 0 { l.firstNode = reversedNode }
            prev?.next = reversedNode
            prev = current
            current = someNode.next
            i += 1
        }
        
        if reverses * k == length {
            l.lastNode = prev
        }
    }
    
    private func length(list: LinkedList<Int>) -> Int {
        var node = list.firstNode
        var count = 0
        
        while let someNode = node {
            count += 1
            node = someNode.next
        }
        
        return count
    }
    
    private func reverse(node: LinkedList<Int>.Node<Int>, k: Int) -> LinkedList<Int>.Node<Int> {
        var prev = node
        var current = node.next
        var i = 1
        
        prev.next = nil
        
        while let someNode = current, i < k {
            let temp = someNode.next
            someNode.next = prev
            prev = someNode
            current = temp
            i += 1
        }
        
        node.next = current
        
        return prev
    }
    
}
