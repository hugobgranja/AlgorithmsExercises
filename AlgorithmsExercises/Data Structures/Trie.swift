//
//  Trie.swift
//  AlgorithmsExercises
//
//  Created by hg on 13/05/2022.
//

import Foundation

class Trie {
    
    class Node {
        var value: Character
        var next: [Character: Node]
        var isMember: Bool
        
        fileprivate init(value: Character, isMember: Bool = false) {
            self.value = value
            self.next = [Character: Node]()
            self.isMember = isMember
        }
    }
    
    let root = Node(value: "\0")
    
    func insert(_ newMember: String) {
        var node = root
        
        for char in newMember {
            if let someNode = node.next[char] {
                node = someNode
            }
            else {
                let newNode = Node(value: char)
                node.next[char] = newNode
                node = newNode
            }
        }
        
        node.isMember = true
    }
    
}
