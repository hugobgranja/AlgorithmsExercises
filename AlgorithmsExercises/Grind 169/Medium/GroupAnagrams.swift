//
//  GroupAnagrams.swift
//  AlgorithmsExercises
//  Created by hg on 10/06/2022.
//
//  |Group Anagrams|
//  |String|Hash Table|
//  Given an array of strings strs, group the anagrams together. You can return the answer in any order.
//  An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
//
//  Alt solution:
//  Use sorted str as key in hash map
//  Since alphabet is limited we can sort in linear time with radix sort
//

import Foundation

class GroupAnagrams {
    
    private let alphabet: [Character: Int] = [
        "a": 0, "b": 1, "c": 2, "d": 3, "e": 4,
        "f": 5, "g": 6, "h": 7, "i":8 , "j": 9,
        "k": 10, "l": 11, "m": 12, "n": 13, "o": 14,
        "p": 15, "q": 16, "r": 17, "s": 18, "t": 19,
        "u": 20, "v": 21, "w": 22, "x": 23, "y": 24,
        "z": 25
    ]
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for str in strs {
            let count = str.reduce(into: [Int](repeating: 0, count: 26)) { $0[alphabet[$1]!] += 1 }
            let countKey = count.reduce("") { $0 + "#\($1)"}
            map[countKey, default: []].append(str)
        }
        
        return [[String]](map.values)
    }
    
}
