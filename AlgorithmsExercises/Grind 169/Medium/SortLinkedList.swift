//
//  SortLinkedList.swift
//  AlgorithmsExercises
//  Created by hg on 15/06/2022.
//
//  |Sort List|
//  |Linked List|Two Pointers|Sorting|Divide and Conquer|Merge Sort|
//  Given the head of a linked list, return the list after sorting it in ascending order.
//

import Foundation

class SortLinkedList {
    
    // Top Down Merge Sort - O(n log n) time, O(log n) space
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head, head.next != nil else { return head }
        
        let mid = mid(head)
        let midNext = mid.next
        mid.next = nil
        
        let left = sortList(head)
        let right = sortList(midNext)
        
        return merge(left, right)
    }
    
    private func mid(_ head: ListNode) -> ListNode {
        var slow = head
        var fast = head.next
        
        while let someFast = fast?.next {
            slow = slow.next!
            fast = someFast.next
        }
        
        return slow
    }
    
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHeadNode = ListNode()
        var firstNode = l1
        var secondNode = l2
        var currentNode = dummyHeadNode
        
        while let someFirst = firstNode, let someSecond = secondNode {
            if someFirst.val <= someSecond.val {
                currentNode.next = someFirst
                currentNode = someFirst
                firstNode = someFirst.next
            }
            else {
                currentNode.next = someSecond
                currentNode = someSecond
                secondNode = someSecond.next
            }
        }
        
        currentNode.next = firstNode != nil ? firstNode : secondNode
        return dummyHeadNode.next
    }
    
    // Bottom Up Merge Sort - O(n log n) time
    func sortList2(_ head: ListNode?) -> ListNode? {
        let dummyHeadNode = ListNode(0, head)
        let length = length(of: head)
        var k = 1
        
        while k < length {
            var currentNode = dummyHeadNode.next
            var tail: ListNode? = dummyHeadNode
            
            while let someCurrentNode = currentNode {
                let left = someCurrentNode
                let right = split(left, k)
                currentNode = split(right, k)
                let (mergedHead, mergedTail) = merge2(left, right)
                tail?.next = mergedHead
                tail = mergedTail
            }
            
            k *= 2
        }
        
        return dummyHeadNode.next
    }
    
    private func length(of node: ListNode?) -> Int {
        var node = node
        var length = 0
        
        while let someNode = node {
            length += 1
            node = someNode.next
        }
        
        return length
    }
    
    private func split(_ head: ListNode?, _ k: Int) -> ListNode? {
        var node = head
        var k = k
        
        while k > 1, let someNode = node {
            node = someNode.next
            k -= 1
        }
        
        let rest = node?.next
        node?.next = nil
        
        return rest
    }
    
    private func merge2(_ l1: ListNode?, _ l2: ListNode?) -> (ListNode?, ListNode?) {
        let dummyHeadNode = ListNode()
        var firstNode = l1
        var secondNode = l2
        var currentNode = dummyHeadNode
        
        while let someFirst = firstNode, let someSecond = secondNode {
            if someFirst.val <= someSecond.val {
                currentNode.next = someFirst
                currentNode = someFirst
                firstNode = someFirst.next
            }
            else {
                currentNode.next = someSecond
                currentNode = someSecond
                secondNode = someSecond.next
            }
        }
        
        currentNode.next = firstNode != nil ? firstNode : secondNode
        
        while let someNode = currentNode.next {
            currentNode = someNode
        }
        
        return (dummyHeadNode.next, currentNode)
    }
    
}
