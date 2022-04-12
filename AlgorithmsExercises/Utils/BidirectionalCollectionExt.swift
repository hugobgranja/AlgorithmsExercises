//
//  BidirectionalCollectionExt.swift
//  AlgorithmsExercises
//
//  Created by hg on 11/04/2022.
//

import Foundation

extension BidirectionalCollection where Element == Character {
    
    subscript(offset: Int) -> Character {
        get {
            return self[index(startIndex, offsetBy: offset)]
        }
    }
    
    subscript(range: Range<Int>) -> SubSequence {
        let offsettedIndex = index(startIndex, offsetBy: range.lowerBound)
        let endIndex = index(startIndex, offsetBy: range.count)
        return self[offsettedIndex..<endIndex]
    }
    
    func asciiValue(at offset: Int) -> UInt8? {
        return self[offset].asciiValue
    }
    
    func subsequence(from start: Int, length: Int) -> SubSequence {
        let offsettedIndex = index(startIndex, offsetBy: start)
        let endIndex = index(offsettedIndex, offsetBy: length)
        return self[offsettedIndex..<endIndex]
    }
    
}
