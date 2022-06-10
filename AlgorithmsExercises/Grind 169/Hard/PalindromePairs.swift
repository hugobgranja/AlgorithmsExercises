//
//  PalindromePairs.swift
//  AlgorithmsExercises
//  Created by hg on 08/07/2022.
//
//  |Palindrome Pairs|
//  |Array|Hash Table|String|Trie|
//  Given a list of unique words, return all the pairs of the distinct indices (i, j) in the given list, so that the concatenation of the two words words[i] + words[j] is a palindrome.
//

import Foundation

class PalindromePairs {
    
    // Naive - TLE
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var result = [[Int]]()
        
        for (i, w1) in words.enumerated() {
            for (j, w2) in words.enumerated() where i != j {
                if isPalindrome(w1 + w2) { result.append([i, j]) }
            }
        }
        
        return result
    }
    
    func palindromePairs2(_ words: [String]) -> [[Int]] {
        let dict = words.enumerated().reduce(into: [String: Int]()) {
            $0[String($1.element.reversed())] = $1.offset
        }
        
        var result = [[Int]]()
        
        for (index, word) in words.enumerated() {
            if let dictIndex = dict[""], dictIndex != index, isPalindrome(word) {
                result.append([index, dictIndex])
                result.append([dictIndex, index])
            }
            
            if let dictIndex = dict[word], dictIndex != index {
                result.append([index, dictIndex])
            }
            
            for (currentIndex, nextIndex) in zip(word.indices, word.indices.dropFirst()) {
                let left = String(word[...currentIndex])
                let right = String(word[nextIndex...])
                
                if let dictIndex = dict[left], dictIndex != index, isPalindrome(right) {
                    result.append([index, dictIndex])
                }
                
                if let dictIndex = dict[right], dictIndex != index, isPalindrome(left) {
                    result.append([dictIndex, index])
                }
            }
        }
        
        return result
    }
    
    // Trie
    func palindromePairs3(_ words: [String]) -> [[Int]] {
        let trie = Trie()
        
        for (index, word) in words.enumerated() {
            trie.insert(word.reversed(), index)
        }
        
        var result = [[Int]]()
        
        for (index, word) in words.enumerated() {
            var node = trie.root
            var matchedWord = true
            
            // Empty string case
            if let nodeIndex = node.index, index != nodeIndex, isPalindrome(word) {
                result.append([index, nodeIndex])
            }
            
            for (charIndex, char) in zip(word.indices, word) {
                if let someNode = node.next[char] {
                    node = someNode
                }
                else {
                    matchedWord = false
                    break
                }
                
                // If we found the reverse of our word it's a palindrome
                // Smaller matches make a palindrome if the rest of our word is a palindrome
                if let nodeIndex = node.index, index != nodeIndex {
                    if words[nodeIndex].count < word.count {
                        let nextIndex = word.index(after: charIndex)
                        if isPalindrome(word[nextIndex...]) {
                            result.append([index, nodeIndex])
                        }
                    }
                    else if words[nodeIndex].count == word.count {
                        result.append([index, nodeIndex])
                    }
                }
            }
            
            // If the word was matched, any other word with a palindrome in between will also make a palindrome.
            if matchedWord {
                for palindromeIndex in findPalindromes(from: node) {
                    result.append([index, palindromeIndex])
                }
            }
        }
        
        return result
    }
    
    private func findPalindromes(from node: Trie.Node) -> [Int] {
        func dfs(_ node: Trie.Node, _ word: String) {
            for (key, node) in node.next {
                let newWord = word + "\(key)"
                if let nodeIndex = node.index, isPalindrome(newWord) {
                    result.append(nodeIndex)
                }
                dfs(node, newWord)
            }
        }
        
        var result = [Int]()
        dfs(node, "")
        return result
    }
    
    private func isPalindrome<T: StringProtocol>(_ s: T) -> Bool {
        guard !s.isEmpty else { return true }
        
        var left = s.startIndex
        var right = s.index(before: s.endIndex)
        
        while left < right {
            if s[left] != s[right] { return false }
            left = s.index(after: left)
            right = s.index(before: right)
        }
        
        return true
    }
    
}

extension PalindromePairs {
    
    class Trie {
        
        class Node {
            var next: [Character: Node]
            var index: Int?
            
            fileprivate init(index: Int? = nil) {
                self.next = [Character: Node]()
                self.index = index
            }
        }
        
        let root = Node()
        
        func insert<T: Collection>(_ newMember: T, _ index: Int) where T.Element == Character {
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
            
            node.index = index
        }
    }
    
}
