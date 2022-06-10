//
//  ContiguousArray.swift
//  AlgorithmsExercises
//  Created by hg on 13/06/2022.
//
//  |Contiguous Array|
//  |Hash Table|Prefix Sum|
//  Given a binary array nums, return the maximum length of a contiguous subarray with an equal number of 0 and 1.
//

import Foundation

class ContiguousArray {
    
    func findMaxLength(_ nums: [Int]) -> Int {
        var maxLength = 0
        var count = 0
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if num == 0 { count -= 1 }
            else { count += 1 }
            
            if count == 0 {
                maxLength = index + 1
            }
            else if let startIndex = map[count] {
                maxLength = max(maxLength, index - startIndex)
            }
            else {
                map[count] = index
            }
        }
        
        return maxLength
    }
    
}
