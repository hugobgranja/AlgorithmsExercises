//
//  RandomizedSet.swift
//  AlgorithmsExercises
//  Created by hg on 24/06/2022.
//
//  |Insert Delete GetRandom O(1)|
//  |Data Structure|Hash Table|Randomized|
//  Implement the RandomizedSet class:
//  RandomizedSet() Initializes the RandomizedSet object.
//  bool insert(int val) Inserts an item val into the set if not present.
//  Returns true if the item was not present, false otherwise.
//  bool remove(int val) Removes an item val from the set if present.
//  Returns true if the item was present, false otherwise.
//  int getRandom() Returns a random element from the current set of elements (it's guaranteed that at least one element exists when this method is called).
//  Each element must have the same probability of being returned.
//  You must implement the functions of the class such that each function works in average O(1) time complexity.
//

import Foundation

class RandomizedSet {
    
    private var map: [Int: Int]
    private var elements: [Int]
    
    init() {
        self.map = [:]
        self.elements = []
    }
    
    func insert(_ val: Int) -> Bool {
        let isPresent = map[val] != nil
        
        if !isPresent {
            map[val] = elements.count
            elements.append(val)
        }
        
        return isPresent
    }
    
    func remove(_ val: Int) -> Bool {
        let isPresent = map[val] != nil
        
        if isPresent {
            let index = map[val]!
            let last = elements.last!
            elements[index] = last
            map[last] = index
            map[val] = nil
            elements.removeLast()
        }
        
        return isPresent
    }
    
    func getRandom() -> Int {
        let index = Int.random(in: 0..<elements.count)
        return elements[index]
    }
    
}
