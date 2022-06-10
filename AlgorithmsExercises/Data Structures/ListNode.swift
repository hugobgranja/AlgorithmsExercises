//
//  ListNode.swift
//  AlgorithmsExercises
//  Created by hg on 24/05/2022.
//

import Foundation

class ListNode {
    
    var val: Int
    var next: ListNode?
    
    init() {
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    init?<T: Collection>(_ elements: T) where T.Element == Int {
        guard let first = elements.first else { return nil }
        self.val = first
        self.next = ListNode(elements.dropFirst())
    }
    
}

extension ListNode: CustomStringConvertible {
    
    var description: String {
        var result = "[\(val)"
        var node = next

        while let someNode = node {
            result += ",\(someNode.val)"
            node = someNode.next
        }
        
        return result + "]"
    }
    
}
