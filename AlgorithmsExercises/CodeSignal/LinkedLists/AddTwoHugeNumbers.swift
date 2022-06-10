//
//  AddTwoHugeNumbers.swift
//  AlgorithmsExercises
//  Created by hg on 01/05/2022.
//
//  You're given 2 huge integers represented by linked lists.
//  Each linked list element is a number from 0 to 9999 that represents a number with exactly 4 digits.
//  The represented number might have leading zeros.
//  Your task is to add up these huge integers and return the result in the same format.
//
//  Example
//  For a = [9876, 5432, 1999] and b = [1, 8001], the output should be
//  solution(a, b) = [9876, 5434, 0].
//  Explanation: 987654321999 + 18001 = 987654340000.
//

import Foundation

class AddTwoHugeNumbers {
    
    func solve(a: LinkedList<Int>, b: LinkedList<Int>) -> LinkedList<Int>? {
        guard let firstNode = a.firstNode, let secondNode = b.firstNode else { return nil }
        let reversedA = reverse(node: firstNode)
        let reversedB = reverse(node: secondNode)
        let sum = add(a: reversedA, b: reversedB)
        reverse(node: reversedA)
        reverse(node: reversedB)
        return sum
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

    private func add(a: LinkedList<Int>.Node<Int>, b: LinkedList<Int>.Node<Int>) -> LinkedList<Int> {
        let result = LinkedList<Int>()
        var a: LinkedList<Int>.Node<Int>? = a
        var b: LinkedList<Int>.Node<Int>? = b
        var carry = 0
        
        while a != nil || b != nil {
            let sum = (a?.element ?? 0) + (b?.element ?? 0) + carry
            carry = sum > 9999 ? 1 : 0
            result.prepend(sum % 10000)
            a = a?.next
            b = b?.next
        }
        
        if carry > 0 {
            result.prepend(carry)
        }
        
        return result
    }
    
}
