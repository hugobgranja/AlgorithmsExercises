//
//  AddSearchWords.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Design Add and Search Words Data Structure|
//  |String|Trie|Data Structure|DFS|
//  Design a data structure that supports adding new words and finding if a string matches any previously added string.
//  Implement the WordDictionary class:
//  WordDictionary() Initializes the object.
//  void addWord(word) Adds word to the data structure, it can be matched later.
//  bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
//

import Foundation

class AddSearchWords {
    
    private class Node {
        var next: [Character: Node]
        var isWord: Bool
        
        fileprivate init(isWord: Bool = false) {
            self.next = [Character: Node]()
            self.isWord = isWord
        }
    }
    
    private let root: Node

    init() {
        self.root = Node()
    }
    
    func addWord(_ word: String) {
        var node = root
        
        for char in word {
            if let someNode = node.next[char] {
                node = someNode
            }
            else {
                let newNode = Node()
                node.next[char] = newNode
                node = newNode
            }
        }
        
        node.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        return search(word, root)
    }
    
    private func search<T: StringProtocol>(_ word: T, _ node: Node) -> Bool {
        guard let char = word.first else { return node.isWord }
        
        if char == "." {
            for nextNode in node.next.values {
                if search(word.dropFirst(), nextNode) { return true }
            }
        }
        else if let nextNode = node.next[char] {
            return search(word.dropFirst(), nextNode)
        }
        
        return false
    }
    
}
