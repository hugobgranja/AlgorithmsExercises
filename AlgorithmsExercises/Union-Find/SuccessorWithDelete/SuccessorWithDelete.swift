//
//  SuccessorWithDelete.swift
//  UnionFindExercises
//
//  Created by hg on 05/10/2020.
//

import Foundation

class SuccessorWithDelete {
    
    var unionFind: UnionFindMaximum
    var length: Int
    
    init(length: Int) throws {
        self.unionFind = try UnionFindMaximum(length: length + 1)
        self.length = length
    }
    
    func remove(_ x: Int) throws {
        try unionFind.union(x, x + 1)
    }
    
    func successor(_ x: Int) throws -> Int {
        let succ = try unionFind.findMaximum(x + 1)
        return succ >= length ? x : succ
    }
    
}
