//
//  Trie.swift
//  AlgorithmsExercises
//  Created by hg on 13/05/2022.
//

import Foundation

class Trie {
    
    class Node {
        var next: [Character: Node]
        var isMember: Bool
        
        fileprivate init(isMember: Bool = false) {
            self.next = [Character: Node]()
            self.isMember = isMember
        }
    }
    
    let root = Node()
    
    func insert<T: StringProtocol>(_ newMember: T) {
        var node = root
        
        for char in newMember {
            if let someNode = node.next[char] {
                node = someNode
            }
            else {
                let newNode = Node()
                node.next[char] = newNode
                node = newNode
            }
        }
        
        node.isMember = true
    }
    
    func remove(_ member: String) {
        @discardableResult
        func remove<T: StringProtocol>(_ member: T, _ node: Node) -> Bool {
            if let first = member.first, let nextNode = node.next[first] {
                let canErase = remove(member.dropFirst(), nextNode)
                
                if canErase && nextNode.next.count == 0 {
                    node.next[first] = nil
                    return true
                }
            }
            else if member.isEmpty {
                node.isMember = false
                return true
            }
            
            return false
        }
        
        remove(member, root)
    }
    
}
