//
//  FirstNonRepeatingCharacter.swift
//  AlgorithmsExercises
//  Created by hg on 26/04/2022.
//
//  Given a string s consisting of small English letters,
//  find and return the first instance of a non-repeating character in it.
//  If there is no such character, return nil.
//

import Foundation

class FirstNonRepeatingCharacter {
    
    func solve(_ str: String) -> Character? {
        var duplicates = Set<Character>()
        var seen = Set<Character>()
        
        for char in str {
            if seen.contains(char) {
                seen.remove(char)
                duplicates.insert(char)
            }
            else if !duplicates.contains(char) {
                seen.insert(char)
            }
        }
        
        return str.first { !duplicates.contains($0) }
    }
    
}
