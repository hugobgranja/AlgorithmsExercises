//
//  UnionFindLargest.swift
//  UnionFindExercises
//
//  Created by hg on 03/10/2020.
//
//  Union-find with specific canonical element.
//  Add a method find() to the union-find data type so that find(i) returns the largest element in the connected component containing i.
//  The operations, union(), connected(), and find() should all take logarithmic time or better.
//  For example, if one of the connected components is {1,2,6,9}, then the find() method should return 9 for each of the four elements in the connected components.
//

import Foundation
import SwiftAlgorithms

class UnionFindMaximum: UnionFind {
    
    enum Exception: Error {
        case invalidArgument
        case argumentOutOfRange
    }
    
    private var parent: [Int]
    private var size: [Int]
    private var maximum: [Int]
    private var count: Int
    
    required init(length: Int) {
        parent = [Int]()
        size = [Int]()
        maximum = [Int]()
        
        for i in 0..<length {
            parent.append(i)
            size.append(1)
            maximum.append(i)
        }
        
        count = length
    }
    
    func union(_ p: Int, _ q: Int) {
        let i = find(p)
        let j = find(q)
        
        if i == j { return }
        
        if size[i] < size[j] {
            parent[i] = j
            size[j] += size[i]
        }
        else  {
            parent[j] = i
            size[i] += size[j]
        }
        
        if maximum[i] > maximum[j] {
            maximum[j] = maximum[i]
        }
        else if maximum[j] > maximum[i] {
            maximum[i] = maximum[j]
        }
        
        count -= 1
    }
    
    func connected(_ p: Int, _ q: Int) -> Bool {
        let i = find(p)
        let j = find(q)
        return i == j
    }
    
    func find(_ p: Int) -> Int {
        var i = p
        while i != parent[i] {
            i = parent[i]
        }
        
        var j = p
        while j != i {
            let newj = parent[j]
            parent[j] = i
            j = newj
        }
        
        return i
    }
    
    func findMaximum(_ p: Int) -> Int {
        let root = find(p)
        return maximum[root]
    }
    
    func components() -> Int {
        return count
    }
    
}
