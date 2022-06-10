//
//  RotateImage.swift
//  AlgorithmsExercises
//  Created by hg on 26/04/2022.
//
//  |Rotate Image|
//  |Matrix|
//  You are given an n x n 2D matrix that represents an image.
//  Rotate the image by 90 degrees (clockwise).
//  Note: Try to solve this task in-place (with O(1) additional memory),
//  since this is what you'll be asked to do during an interview.
//

import Foundation

class RotateImage {
    
    func solve(_ a: inout [[Int]]) -> [[Int]] {
        for levelStart in 0..<a.count/2 {
            let levelEnd = a.count - levelStart - 1
            
            for i in 0..<levelEnd - levelStart {
                let temp = a[levelStart][levelStart + i]
                a[levelStart][levelStart + i] = a[levelEnd - i][levelStart]
                a[levelEnd - i][levelStart] = a[levelEnd][levelEnd - i]
                a[levelEnd][levelEnd - i] = a[levelStart + i][levelEnd]
                a[levelStart + i][levelEnd] = temp
            }
        }
        
        return a
    }
    
}
