//
//  FindKthLargest.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//
//  |Find Kth Largest Element in an Array|
//  |Quickselect|
//  Given an integer array nums and an integer k, return the kth largest element in the array.
//  Note that it is the kth largest element in the sorted order, not the kth distinct element.
//

import Foundation

class FindKthLargest {
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        return select(&nums, k: nums.count - k)!
    }
    
    private func select(_ nums: inout [Int], k: Int) -> Int? {
        guard k < nums.count else { return nil }
        
        nums.shuffle()
        var low = 0, high = nums.count - 1
        
        while high > low {
            let j = partition(&nums, low, high)
            if j < k { low = j + 1 }
            else if j > k { high = j - 1 }
            else { return nums[k] }
        }
        
        return nums[k]
    }
    
    private func partition(_ nums: inout [Int], _ low: Int, _ high: Int) -> Int {
        let pivot = nums[low]
        var i = low
        var j = high + 1
        
        while true {
            repeat { i += 1 } while nums[i] < pivot && i != high
            repeat { j -= 1 } while nums[j] > pivot && j != low
            if i >= j { break }
            nums.swapAt(i, j)
        }
        
        nums.swapAt(low, j)
        return j
    }
    
}
