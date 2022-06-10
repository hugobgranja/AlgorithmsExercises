//
//  LongestFSPath.swift
//  AlgorithmsExercises
//  Created by hg on 18/05/2022.
//

import Foundation

class LongestFSPath {
    
    func solve(fileSystem: String) -> Int {
        var stack = [0]
        var maxCount = 0
        var currentCount = 0
        var currentLevel = 0
        var isFile = false
        var index = fileSystem.startIndex
        
        while index < fileSystem.endIndex {
            switch fileSystem[index] {
            case ".":
                isFile = true
                currentCount += 1
                index = fileSystem.index(after: index)
            
            case "\u{C}":
                let nextIndex = fileSystem.index(after: index)
                
                let level = fileSystem
                    .suffix(from: nextIndex)
                    .enumerated()
                    .first { $0.element != "\t" }!
                    .offset
                
                let newCount = stack.last! + currentCount
                
                if isFile && newCount > maxCount {
                    maxCount = newCount
                }
                
                if level > currentLevel {
                    stack.append(newCount + 1)
                }
                else if level < currentLevel {
                    stack.removeLast(currentLevel - level)
                }
                
                isFile = false
                currentCount = 0
                currentLevel = level
                index = fileSystem.index(nextIndex, offsetBy: level)
                
            default:
                currentCount += 1
                index = fileSystem.index(after: index)
            }
        }
        
        let lastCount = stack.last! + currentCount
        if isFile && lastCount > maxCount { maxCount = lastCount }
        
        return maxCount
    }
    
}
