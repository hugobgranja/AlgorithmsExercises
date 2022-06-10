//
//  SuccessorWithDelete.swift
//  UnionFindExercises
//  Created by hg on 05/10/2020.
//
//  Successor with delete.
//  Given a set of nn integers S = {0,1,...,n−1} and a sequence of requests of the following form:
//  - Remove x from S
//  - Find the successor of x: the smallest y in S such that y >= x.
//  design a data type so that all operations (except construction) take logarithmic time or better in the worst case.
//

import Foundation

class SuccessorWithDelete {
    
    var unionFind: UnionFindMaximum
    var length: Int
    
    init(length: Int) {
        self.unionFind = UnionFindMaximum(length: length + 1)
        self.length = length
    }
    
    func remove(_ x: Int) {
        unionFind.union(x, x + 1)
    }
    
    func successor(_ x: Int) -> Int {
        let succ = unionFind.findMaximum(x + 1)
        return succ >= length ? x : succ
    }
    
}
