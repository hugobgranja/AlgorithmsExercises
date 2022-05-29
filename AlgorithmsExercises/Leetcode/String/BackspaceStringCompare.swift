//
//  BackspaceStringCompare.swift
//  AlgorithmsExercises
//
//  Created by hg on 28/05/2022.
//
//  Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.
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
        var sIndex = s.count - 1
        var tIndex = t.count - 1
        var sBackspaceCount = 0
        var tBackspaceCount = 0
        
        while sIndex >= 0 || tIndex >= 0 {
            while sIndex >= 0 {
                let strIndex = s.index(s.startIndex, offsetBy: sIndex)
                
                if s[strIndex] == "#" {
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
                let strIndex = t.index(t.startIndex, offsetBy: tIndex)
                
                if t[strIndex] == "#" {
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
                let strIndexS = s.index(s.startIndex, offsetBy: sIndex)
                let strIndexT = t.index(t.startIndex, offsetBy: tIndex)
                if s[strIndexS] != t[strIndexT] { return false }
            }
            
            if (sIndex >= 0) != (tIndex >= 0) { return false }
            
            sIndex -= 1
            tIndex -= 1
        }
        
        return true
    }
    
}
