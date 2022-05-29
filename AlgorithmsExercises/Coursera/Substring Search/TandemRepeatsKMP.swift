//
//  TandemRepeatsKMP.swift
//  AlgorithmsExercises
//
//  Created by hg on 07/04/2022.
//
//  Added an extra state to the dfa to loop back to the start.
//  Search keeps track of repeats found.
//

import Foundation

class TandemRepeatsKMP {
    
    private let radix: Int
    private let patternLength: Int
    private var dfa: [[Int]]
    
    init(pattern: String) {
        self.radix = 128
        self.patternLength = pattern.count
        self.dfa = [[Int]](
            repeating: [Int](repeating: 0, count: pattern.count + 1),
            count: radix
        )
        
        buildDfa(for: pattern)
    }
    
    private func buildDfa(for pattern: String) {
        let firstCharValue = Int(pattern.first!.asciiValue!)
        dfa[firstCharValue][0] = 1
        var mismatchState = 0
        
        for state in 1..<pattern.count {
            for char in 0..<radix {
                dfa[char][state] = dfa[char][mismatchState]
            }
            
            let charValue = Int(pattern.asciiValue(at: state)!)
            dfa[charValue][state] = state + 1
            mismatchState = dfa[charValue][mismatchState]
        }
        
        let state = pattern.count
        for char in 0..<radix {
            dfa[char][state] = dfa[char][mismatchState]
        }
        dfa[firstCharValue][state] = 1
    }
    
    func search(in text: String) -> Range<String.Index>? {
        guard text.count > patternLength else { return nil }
        
        var i = 0, j = 0
        var maxMatches = 0
        var currentMatches = 0
        var maxStart = 0
        
        while i < text.count {
            let charValue = Int(text.asciiValue(at: i)!)
            let prevj = j
            j = dfa[charValue][j]
            
            if j == patternLength {
                currentMatches += 1
                
                if currentMatches > maxMatches {
                    maxMatches = currentMatches
                    maxStart = i - patternLength * maxMatches + 1
                }
            }
            
            // If dfa went back with the exception of the repeat case it's a mismatch
            let mismatch = (j < prevj && prevj != patternLength) || (prevj == patternLength && j != 1)
            if mismatch { currentMatches = 0 }
            
            i += 1
        }
        
        if maxMatches > 1 {
            let start = text.index(text.startIndex, offsetBy: maxStart)
            let end = text.index(start, offsetBy: patternLength * maxMatches)
            return start..<end
        }
        
        return nil
    }

}
