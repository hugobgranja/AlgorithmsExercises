//
//  FindKClosestElements.swift
//  AlgorithmsExercises
//  Created by hg on 14/06/2022.
//
//  |Find K Closest Elements|
//  |Sorted Array|Binary Search|
//  Given a sorted integer array arr, two integers k and x, return the k closest integers to x in the array. The result should also be sorted in ascending order.
//  An integer a is closer to x than an integer b if:
//  |a - x| < |b - x|, or
//  |a - x| == |b - x| and a < b
//

import Foundation

class FindKClosestElements {
    
    // O(n)
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count
        
        while left < right && right - left > k {
            let leftDiff = x - arr[left]
            let rightDiff = arr[right - 1] - x
            if leftDiff <= rightDiff { right -= 1 }
            else { left += 1 }
        }
        
        return [Int](arr[left..<right])
    }
    
    // O(logn + k)
    func findClosestElements2(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard var left = nearestBinSearch(arr, x) else { return [] }
        var right = left
        
        for _ in 0..<(k - 1) {
            if left == 0 {
                right += 1
            }
            else if right == arr.count - 1 || x - arr[left - 1] <= arr[right + 1] - x {
                left -= 1
            }
            else {
                right += 1
            }
        }
        
        return [Int](arr[left...right])
    }
    
    private func nearestBinSearch(_ array: [Int], _ element: Int) -> Int? {
        guard !array.isEmpty else { return nil }
        if element < array.first! { return 0 }
        if element > array.last! { return array.count - 1 }
        
        var lowerBound = 0
        var upperBound = array.count - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            if element < array[mid] { upperBound = mid - 1 }
            else if element > array[mid] { lowerBound = mid + 1 }
            else { return mid }
        }
        
        return array[lowerBound] - element < element - array[upperBound] ? lowerBound : upperBound
    }
    
    // O(log(n−k) + k)
    func findClosestElements3(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left = 0
        var right = arr.count - k
        
        while left < right {
            let mid = left + (right - left) / 2
            if x - arr[mid] <= arr[mid + k] - x { right = mid }
            else { left = mid + 1 }
        }
        
        return [Int](arr[left..<left+k])
    }
    
}
