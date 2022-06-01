//
//  ImplementTrie.swift
//  AlgorithmsExercises
//
//  Created by hg on 31/05/2022.
//
//  A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.
//
//  Implement the Trie class:
//  Trie() Initializes the trie object.
//  void insert(String word) Inserts the string word into the trie.
//  boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
//  boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
//

import Foundation

class ImplementTrie {
    
    class Node {
        var next: [Character: Node]
        var isWord: Bool
        
        fileprivate init(isWord: Bool = false) {
            self.next = [Character: Node]()
            self.isWord = isWord
        }
    }
    
    let root: Node
    
    init() {
        self.root = Node()
    }
    
    func insert(_ word: String) {
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
        return find(word)?.isWord == true
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }
    
    private func find(_ word: String) -> Node? {
        var node = root
        
        for char in word {
            if let someNode = node.next[char] {
                node = someNode
            }
            else {
                return nil
            }
        }
        
        return node
    }
    
}
