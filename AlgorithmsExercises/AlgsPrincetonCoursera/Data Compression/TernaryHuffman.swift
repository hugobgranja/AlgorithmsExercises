//
//  TernaryHuffman.swift
//  AlgorithmsExercises
//  Created by hg on 19/04/2022.
//
//  Ternary Huffman codes.
//  Generalize the Huffman algorithm to codewords over the ternary alphabet (0, 1, and 2) instead of the binary alphabet.
//  That is, given a bytestream, find a prefix-free ternary code that uses as few trits (0s, 1s, and 2s) as possible. Prove that it yields optimal prefix-free ternary code.
//

import Foundation
import SwiftAlgorithms

class TernaryHuffman {
    
    private let radix: Int
    
    init() {
        self.radix = 128
    }
    
    func compress(_ string: String) -> Data? {
        let frequencyCounts = createFrequencyCounts(string: string)
        guard let root = createTrie(frequencyCounts: frequencyCounts) else { return nil }
        let codeTable = createCodeTable(node: root)
        let builder = encodeTrie(node: root)
        builder.append(Int64(string.count))
        
        for char in string {
            let asciiValue = Int(char.asciiValue!)
            let code = codeTable[asciiValue]
            
            for char in code {
                switch char {
                case "0":
                    builder.append(0, bitWidth: 2)
                    
                case "1":
                    builder.append(1, bitWidth: 2)
                
                case "2":
                    builder.append(2, bitWidth: 2)
                    
                default:
                    break
                }
            }
        }
        
        return builder.getData()
    }
    
    private func createFrequencyCounts(string: String) -> [Int] {
        var frequencyCounts = [Int](repeating: 0, count: radix)
        
        for char in string {
            let asciiValue = Int(char.asciiValue!)
            frequencyCounts[asciiValue] += 1
        }
        
        return frequencyCounts
    }
    
    private func createTrie(frequencyCounts: [Int]) -> Node? {
        let pq = MinBinaryHeap<Node>()
        
        for index in 0..<frequencyCounts.count {
            let frequency = frequencyCounts[index]
            
            if frequency > 0 {
                let char = UnicodeScalar(index).map { Character($0) }!
                let newNode = Node(char: char, frequency: frequency)
                pq.enqueue(newNode)
            }
        }
        
        if pq.count < 3 || pq.count.isMultiple(of: 2) {
            pq.enqueue(Node(char: "\0", frequency: 0))
        }
        
        while pq.count > 1 {
            let left = pq.dequeue()
            let mid = pq.dequeue()
            let right = pq.dequeue()
            let frequency = (left?.frequency ?? 0) + (mid?.frequency ?? 0) + (right?.frequency ?? 0)
            let parent = Node(char: "\0", frequency: frequency, left: left, mid: mid, right: right)
            pq.enqueue(parent)
        }
        
        return pq.dequeue()
    }
    
    private func createCodeTable(node: Node) -> [String] {
        var codeTable = [String](repeating: "", count: radix)
        var stack = ArrayStack<(Node, String)>([(node, "")])
        
        while let (node, code) = stack.pop() {
            if node.isLeaf() {
                let asciiValue = Int(node.char.asciiValue!)
                codeTable[asciiValue] = code
            }
            else {
                if let left = node.left { stack.push((left, code + "0")) }
                if let mid = node.mid { stack.push((mid, code + "1")) }
                if let right = node.right { stack.push((right, code + "2")) }
            }
        }
        
        return codeTable
    }
    
    private func encodeTrie(node: Node) -> BinaryDataBuilder {
        let builder = BinaryDataBuilder()
        var stack = ArrayStack<Node>([node])
        
        while let node = stack.pop() {
            if node.isLeaf() {
                builder.append(bit: true)
                builder.append(byte: node.char.asciiValue!)
            }
            else {
                builder.append(bit: false)
                if let right = node.right { stack.push(right) }
                if let mid = node.mid { stack.push(mid) }
                if let left = node.left { stack.push(left) }
            }
        }
        
        return builder
    }
    
    func expand(data: Data) -> String? {
        let reader = BinaryDataReader(data: data)
        
        guard
            let root = readTrie(reader: reader),
            let length = reader.readInt64()
        else {
            return nil
        }
        
        var string = ""
        
        for _ in 0..<length {
            var node = root
            
            while !node.isLeaf() {
                let bits = reader.readInt(bitWidth: 2)!
                switch bits {
                case 0: node = node.left!
                case 1: node = node.mid!
                case 2: node = node.right!
                default: break
                }
            }
            
            string.append(node.char)
        }
        
        return string
    }
    
    private func readTrie(reader: BinaryDataReader) -> Node? {
        guard let isLeaf = reader.readBit() else { return nil }
        
        if isLeaf {
            let asciiValue = reader.readByte()!
            let char = Character(UnicodeScalar(asciiValue))
            return Node(char: char, frequency: -1)
        }
        else {
            return Node(
                char: "\0",
                frequency: -1,
                left: readTrie(reader: reader),
                mid: readTrie(reader: reader),
                right: readTrie(reader: reader)
            )
        }
    }
    
}

extension TernaryHuffman {
    
    fileprivate class Node: Comparable {
        
        let char: Character
        let frequency: Int
        let left: Node?
        let mid: Node?
        let right: Node?
        
        init(
            char: Character,
            frequency: Int,
            left: Node? = nil,
            mid: Node? = nil,
            right: Node? = nil
        ) {
            self.char = char
            self.frequency = frequency
            self.left = left
            self.mid = mid
            self.right = right
        }
        
        func isLeaf() -> Bool {
            return left == nil && mid == nil && right == nil
        }
        
        static func == (lhs: TernaryHuffman.Node, rhs: TernaryHuffman.Node) -> Bool {
            return lhs.char == rhs.char
        }
        
        static func < (lhs: TernaryHuffman.Node, rhs: TernaryHuffman.Node) -> Bool {
            return lhs.frequency < rhs.frequency
        }
        
    }
    
}

