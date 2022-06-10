//
//  LRUCache.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//
//  |LRU Cache|
//  |Linked List|Doubly-Linked List|Data Structure|Hash Table|
//  Design a data structure that follows the constraints of a Least Recently Used (LRU) cache.
//  Implement the LRUCache class:
//  LRUCache(int capacity) Initialize the LRU cache with positive size capacity.
//  int get(int key) Return the value of the key if the key exists, otherwise return -1.
//  void put(int key, int value) Update the value of the key if the key exists. Otherwise, add the key-value pair to the cache. If the number of keys exceeds the capacity from this operation, evict the least recently used key.
//  The functions get and put must each run in O(1) average time complexity.
//

import Foundation

class LRUCache {
    
    class Node {
        let key: Int
        let val: Int
        var prev: Node?
        var next: Node?
        
        init(_ key: Int, _ val: Int) {
            self.key = key
            self.val = val
        }
    }
    
    private let capacity: Int
    private var map: [Int: Node]
    private var head: Node
    private var tail: Node
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.map = [:]
        self.head = Node(0, 0)
        self.tail = Node(0, 0)
        head.next = tail
        tail.prev = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            remove(node)
            insert(node)
            return node.val
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            remove(node)
        }
        
        let newNode = Node(key, value)
        map[key] = newNode
        insert(newNode)
        
        if map.count > capacity {
            let lru = head.next!
            remove(lru)
            map[lru.key] = nil
        }
    }
    
    private func insert(_ node: Node) {
        let beforeTail = tail.prev
        tail.prev = node
        beforeTail?.next = node
        node.next = tail
        node.prev = beforeTail
    }
    
    private func remove(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }
    
}
