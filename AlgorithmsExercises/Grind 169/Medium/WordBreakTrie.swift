//
//  WordBreakTrie.swift
//  AlgorithmsExercises
//  Created by hg on 04/06/2022.
//
//  |Word Break|
//  |Trie|Aho-Corasick|
//  Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.
//  Note that the same word in the dictionary may be reused multiple times in the segmentation.
//

import Foundation

class WordBreakTrie {
    
    // Aho-Corasick algorithm
    // Keeps valid interval ends of matches
    // A valid end comes from an interval where the start is 0 or the start is a valid end.
    // Can word break if the length of the string is a valid end
    // O(n) to build the trie.
    // O(m + z) where m is the length of the string and z the number of matches to find word breaks.
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let trie = buildTrie(patterns: wordDict)
        let charStr = Array(s)
        var node = trie.root
        var validEnds = Set<Int>()
        var index = 0
        
        while index < charStr.count {
            let char = charStr[index]
            
            if let someNode = node.next[char] {
                node = someNode
                index += 1
            }
            else if let suffixLink = node.suffixLink {
                node = suffixLink
            }
            else {
                index += 1
            }
            
            if node.isMember || node.outputLink != nil {
                var matchNode = node.isMember ? node : node.outputLink
                
                while let someNode = matchNode {
                    let lowerBound = index - someNode.level
                    
                    if lowerBound == 0 || validEnds.contains(lowerBound) {
                        validEnds.insert(index)
                    }
                    
                    matchNode = someNode.outputLink
                }
            }
        }
        
        return validEnds.contains(charStr.count)
    }
    
    // O(n) where n is the sum of the length of the patterns.
    private func buildTrie(patterns: [String]) -> Trie {
        let trie = Trie()
        
        patterns.forEach { trie.insert($0) }
        
        var queue = [(Node,Node)]()
        for next in trie.root.next.values { queue.append((trie.root, next)) }
        
        while let (prev, current) = queue.first {
            queue.removeFirst()
            
            if prev === trie.root {
                current.suffixLink = trie.root
            }
            else {
                var node = prev.suffixLink!
                
                while current.suffixLink == nil {
                    if let someNode = node.next[current.value] {
                        current.suffixLink = someNode
                    }
                    else if node === trie.root {
                        current.suffixLink = trie.root
                    }
                    else {
                        node = node.suffixLink!
                    }
                }
                
                if current.suffixLink!.isMember {
                    current.outputLink = current.suffixLink
                }
                else {
                    current.outputLink = current.suffixLink!.outputLink
                }
            }
            
            for next in current.next.values { queue.append((current, next)) }
        }
        
        return trie
    }
    
    private class Trie {
        let root = Node(value: "\0")
        
        func insert(_ newMember: String) {
            var node = root
            var level = 1
            
            for char in newMember {
                if let someNode = node.next[char] {
                    node = someNode
                }
                else {
                    let newNode = Node(value: char, level: level)
                    node.next[char] = newNode
                    node = newNode
                }
                
                level += 1
            }
            
            node.isMember = true
        }
    }
    
    private class Node {
        var value: Character
        var next: [Character: Node]
        var isMember: Bool
        var suffixLink: Node?
        var outputLink: Node?
        var level: Int
        
        fileprivate init(value: Character, isMember: Bool = false, level: Int = 0) {
            self.value = value
            self.next = [Character: Node]()
            self.isMember = isMember
            self.level = level
        }
    }
    
}
