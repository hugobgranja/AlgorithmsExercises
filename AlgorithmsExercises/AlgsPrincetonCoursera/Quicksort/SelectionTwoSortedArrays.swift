//
//  SelectionTwoSortedArrays.swift
//  AlgorithmsExercises
//  Created by hg on 14/11/2020.
//
//  Selection in two sorted arrays.
//  Given two sorted arrays a[] and b[], of lengths n1 and n2 and an integer 0 <= k < n1 + n2, design an algorithm to find a key of rank k. The order of growth of the worst case running time of your algorithm should be logn, where n = n1 + n2.
//  Version 1: n1=n2 (equal length arrays) and k=n/2 (median).
//  Version 2: k=n/2 (median).
//  Version 3: no restrictions.
//

import Foundation

struct ArrayBounds {
    var start: Int
    var end: Int
    var count: Int { return end - start + 1 }
}

class SelectionTwoSortedArrays {
    
    // --------- Version 1 -----------
    
    func selectV1<T: Comparable>(_ a: [T], _ b: [T]) -> T? {
        if a.count != b.count || a.isEmpty { return nil }
        var aStart = 0, bStart = 0
        var rank = a.count

        while rank > 1 {
            let halfRank = rank / 2
            let i = aStart + halfRank
            let j = bStart + halfRank

            if a[i] > b[j] { bStart = j }
            else { aStart = i }

            rank -= halfRank
        }

        return max(a[aStart], b[bStart])
    }
    
    // --------- Version 2 -----------
    
    func selectV2<T: Comparable>(_ a: [T], _ b: [T]) -> T? {
        if a.count < 0 { return nil }
        var aBounds = ArrayBounds(start: 0, end: a.count - 1)
        var bBounds = ArrayBounds(start: 0, end: b.count - 1)
        var rank = (a.count + b.count) / 2

        while true {
            if aBounds.start > aBounds.end { return max(a[aBounds.end], b[bBounds.start + rank]) }
            if bBounds.start > bBounds.end { return max(a[aBounds.start + rank], b[bBounds.end]) }
            if rank == 0 { return min(a[aBounds.start], b[bBounds.start]) }
            
            let halfRank = rank / 2
            let i = max(min(aBounds.start + halfRank, aBounds.end), aBounds.start)
            let j = max(min(bBounds.start + halfRank, bBounds.end), bBounds.start)
            
            if a[i] > b[j] {
                let removed = max(j - bBounds.start, 1)
                rank -= removed
                bBounds.start += removed
            }
            else {
                let removed = max(i - aBounds.start, 1)
                rank -= removed
                aBounds.start += removed
            }
        }
    }
    
    
    // --------- Version 3 -----------
    
    func selectV3<T: Comparable>(_ a: [T], _ b: [T], rank: Int) -> T? {
        if a.count < 0 { return nil }
        var aBounds = ArrayBounds(start: 0, end: a.count - 1)
        var bBounds = ArrayBounds(start: 0, end: b.count - 1)
        var rank = rank

        while true {
            if aBounds.start > aBounds.end { return max(a[aBounds.end], b[bBounds.start + rank]) }
            if bBounds.start > bBounds.end { return max(a[aBounds.start + rank], b[bBounds.end]) }
            if rank == 0 { return min(a[aBounds.start], b[bBounds.start]) }
            
            let halfRank = rank / 2
            let i = max(min(aBounds.start + halfRank, aBounds.end), aBounds.start)
            let j = max(min(bBounds.start + halfRank, bBounds.end), bBounds.start)
            
            if a[i] > b[j] {
                let removed = max(j - bBounds.start, 1)
                rank -= removed
                bBounds.start += removed
            }
            else {
                let removed = max(i - aBounds.start, 1)
                rank -= removed
                aBounds.start += removed
            }
        }
    }
    
}
