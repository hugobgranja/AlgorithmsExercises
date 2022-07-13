//
//  BackspaceStringCompare.swift
//  AlgorithmsExercises
//  Created by hg on 28/05/2022.
//
//  |Backspace String Compare|
//  |String|Two Pointers|
//  Given two strings s and t, return true if they are equal when both are typed into empty text editors.
//  '#' means a backspace character.
//  Note that after backspacing an empty text, the text will continue empty.
//

import Foundation

class BackspaceStringCompare {
    
    // O(m + n) time, O(m + n) space where m = s.count and n = t.count
    func solve(_ s: String, _ t: String) -> Bool {
        return build(s) == build(t)
    }
    
    private func build(_ s: String) -> String {
        var result = ""
        
        for char in s {
            if char == "#" {
                if !result.isEmpty { result.removeLast() }
            }
            else {
                result.append(char)
            }
        }
        
        return result
    }
    
    // O(m + n) time, O(1) space where m = s.count and n = t.count
    func solve2(_ s: String, _ t: String) -> Bool {
        let s = [Character](s)
        let t = [Character](t)
        var sIndex = s.count - 1
        var tIndex = t.count - 1
        var sBackspaceCount = 0
        var tBackspaceCount = 0
        
        while sIndex >= 0 || tIndex >= 0 {
            while sIndex >= 0 {
                if s[sIndex] == "#" {
                    sBackspaceCount += 1
                    sIndex -= 1
                }
                else if sBackspaceCount > 0 {
                    sBackspaceCount -= 1
                    sIndex -= 1
                }
                else {
                    break
                }
            }
            
            while tIndex >= 0 {
                if t[tIndex] == "#" {
                    tBackspaceCount += 1
                    tIndex -= 1
                }
                else if tBackspaceCount > 0 {
                    tBackspaceCount -= 1
                    tIndex -= 1
                }
                else {
                    break
                }
            }
            
            if sIndex >= 0 && tIndex >= 0 {
                if s[sIndex] != t[tIndex] { return false }
            }
            
            if (sIndex >= 0) != (tIndex >= 0) { return false }
            
            sIndex -= 1
            tIndex -= 1
        }
        
        return true
    }
    
}
