//
//  IsListPalindrome.swift
//  AlgorithmsExercises
//
//  Created by hg on 29/04/2022.
//
//  Given a singly linked list of integers, determine whether or not it's a palindrome.
//  Solve this task in O(n) time using O(1) additional space, where n is the number of elements in l.
//

import Foundation

class IsListPalindrome {
    
    func solve(list: LinkedList<Int>) -> Bool {
        guard let firstNode = list.firstNode else { return true }
        
        let midNode = mid(node: firstNode)
        let reversedMidNode = reverse(node: midNode)
        let isPalindrome = isEqualIgnoreLength(firstNode, reversedMidNode)
        
        reverse(node: reversedMidNode)
        
        return isPalindrome
    }
    
    private func mid(node: LinkedList<Int>.Node<Int>) -> LinkedList<Int>.Node<Int> {
        var slow = node
        var fast: LinkedList<Int>.Node<Int>? = node
        
        while let someNode = fast, let slowNext = slow.next {
            slow = slowNext
            fast = someNode.next?.next
        }
        
        return slow
    }
    
    @discardableResult
    private func reverse(node: LinkedList<Int>.Node<Int>) -> LinkedList<Int>.Node<Int> {
        var prev = node
        var current = node.next
        
        prev.next = nil
        
        while let someNode = current {
            let temp = someNode.next
            someNode.next = prev
            prev = someNode
            current = temp
        }
        
        return prev
    }
    
    private func isEqualIgnoreLength(
        _ first: LinkedList<Int>.Node<Int>?,
        _ second: LinkedList<Int>.Node<Int>?
    ) -> Bool {
        var first = first
        var second = second
        
        while let someSecond = second {
            if first?.element != someSecond.element { return false }
            first = first?.next
            second = someSecond.next
        }
        
        return true
    }
    
}
