//
//  DocumentSearch.swift
//  AlgorithmsExercises
//
//  Created by hg on 13/02/2021.
//
//  Document search.
//  Design an algorithm that takes a sequence of n document words and a sequence of m query words and find the shortest interval in which the m query words appear in the document in the order given.
//  The length of an interval is the number of words in that interval.
//

import Foundation
import SwiftAlgorithms

class DocumentSearch {
    
    var dictionary: [String: [Int]]
    
    init(document: String) {
        self.dictionary = Dictionary()
        buildDictionary(document: document)
    }
    
    private func buildDictionary(document: String) {
        let characterSet = CharacterSet.whitespaces.union(.punctuationCharacters)
        let words = document.components(separatedBy: characterSet).filter { $0 != "" }
        
        for i in 0..<words.count {
            let word = String(words[i])
            var indices = dictionary[word, default: [Int]()]
            indices.append(i)
            dictionary[word] = indices
        }
    }
    
    func findInterval(words: [String]) -> (Int, Int)? {
        var intervals = [(Int,Int)]()
        
        for word in words {
            guard let indices = dictionary[word] else { return nil }
            intervals = add(indices: indices, to: intervals)
            if intervals.isEmpty { return nil }
        }
        
        return findShortestInterval(intervals: intervals)
    }
    
    private func add(indices: [Int], to intervals: [(Int,Int)]) -> [(Int, Int)] {
        if intervals.isEmpty { return indices.map { ($0, $0) } }
        
        var newIntervals = [(Int,Int)]()
        
        for (low, high) in intervals {
            for index in indices {
                if high < index {
                    newIntervals.append((low, index))
                }
            }
        }
        
        return newIntervals
    }
    
    private func findShortestInterval(intervals: [(Int, Int)]) -> (Int, Int)? {
        var minDistance = Int.max
        var minInterval: (Int, Int)? = nil
        
        for (low, high) in intervals {
            let distance = high - low
            if distance < minDistance {
                minDistance = distance
                minInterval = (low, high)
            }
        }
        
        return minInterval
    }
    
}
