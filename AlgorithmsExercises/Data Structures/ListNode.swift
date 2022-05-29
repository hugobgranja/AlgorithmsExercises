//
//  ListNode.swift
//  AlgorithmsExercises
//
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
    
}
