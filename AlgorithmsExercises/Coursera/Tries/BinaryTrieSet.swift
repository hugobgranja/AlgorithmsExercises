//
//  BinaryTrieSet.swift
//  AlgorithmsExercises
//
//  Created by hg on 05/04/2022.
//

import Foundation

class BinaryTrieSet {
    
    private var root: Node
    var count: Int
    
    public init() {
        self.root = Node(isMember: false)
        self.count = 0
    }
    
    public func insert(_ newMember: String) {
        var node = root
        var index = 0
        
        while index < newMember.count {
            if let someNode = get(from: node, to: newMember, at: index) {
                node = someNode
            }
            else {
                let value = value(of: newMember, at: index)!
                let newNode = Node(isMember: false)
                node.next[value] = newNode
                node = newNode
            }
            
            index += 1
        }
        
        if !node.isMember { count += 1 }
        node.isMember = true
    }
    
    private func get(from node: Node, to member: String, at index: Int) -> Node? {
        return value(of: member, at: index).flatMap { node.next[$0] }
    }
    
    private func value(of string: String, at index: Int) -> Int? {
        guard index < string.count else { return nil }
        let strIndex = string.index(string.startIndex, offsetBy: index)
        
        switch string[strIndex] {
        case "0": return 0
        case "1": return 1
        default: return nil
        }
    }
    
    public func longestPrefix(of member: String) -> String? {
        var longest: Substring?
        var node = root
        var index = 0
        
        while let someNode = get(from: node, to: member, at: index), index < member.count - 1 {
            if someNode.isMember {
                longest = member.prefix(index + 1)
            }
            
            node = someNode
            index += 1
        }
        
        return longest.map { String($0) }
    }
    
}

extension BinaryTrieSet {
    
    public class Node {
        
        public var next: [Node?]
        public var isMember: Bool
        
        fileprivate init(isMember: Bool) {
            self.next = [Node?](repeating: nil, count: 2)
            self.isMember = isMember
        }
        
    }
    
}
