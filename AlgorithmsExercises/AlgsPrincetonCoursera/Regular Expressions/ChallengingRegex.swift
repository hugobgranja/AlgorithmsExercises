//
//  ChallengingRegex.swift
//  AlgorithmsExercises
//  Created by hg on 12/04/2022.
//
//  Challenging REs.
//  Construct a regular expression for each of the following languages over the binary alphabet or prove that no such regular expression is possible:
//  1. All strings except 11 or 111.
//  2. Strings with 1 in every odd-number bit position.
//  3. Strings with an equal number of 0s and 1s.
//  4. Strings with at least two 0s and at most one 1.
//  5. Strings that when interpreted as a binary integer are a multiple of 3.
//  6. Strings with no two consecutive 1s.
//  7. Strings that are palindromes (same forwards and backwards).
//  8. Strings with an equal number of substrings of the form 01 and 10.
//
//  My suggestion: Create a dfa and then use the state elimination method.
//

import Foundation

class ChallengingRegex {
    
    func one() -> String {
        return "^(1|(0|10|101|110|111[01])(0|1)*)$"
    }
    
    func two() -> String {
        return "^(0|1)?(1(0|1))*$"
    }
    
    func three() -> String {
        return "Impossible"
    }
    
    func four() -> String {
        return "^(100+|0+10+|00+1)$"
    }
    
    func five() -> String {
        return "^(0*|1(01*0)*1)*$"
    }
    
    func six() -> String {
        return "^(0|10)*1?$"
    }
    
    func seven() -> String {
        return "Impossible"
    }
    
    // Learned from the gentleman in this video
    // https://www.youtube.com/watch?v=yuFF0gXC6HU
    // And then converted his dfa into a regex using the state elimination method
    func eight() -> String {
        return "^((0+|(0+1(1|0+1)*0+))|(1+|(1+0(0|1+0)*1+)))$"
    }
    
}
