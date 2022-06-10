//
//  SortColors.swift
//  AlgorithmsExercises
//  Created by hg on 04/06/2022.
//
//  |Sort Colors|Dutch National Flag|
//  |Two Pointers|Sorting|
//  Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.
//  We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.
//

import Foundation

class SortColors {
    
    func sortColors(_ nums: inout [Int]) {
        var left = 0, current = 0
        var right = nums.count - 1
        
        while current <= right {
            let color = nums[current]
            
            if color == 0 {
                nums.swapAt(left, current)
                left += 1
                current += 1
            }
            else if color == 2 {
                nums.swapAt(current, right)
                right -= 1
            }
            else {
                current += 1
            }
        }
    }
    
}
