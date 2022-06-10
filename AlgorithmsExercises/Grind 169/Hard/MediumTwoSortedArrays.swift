//
//  MediumTwoSortedArrays.swift
//  AlgorithmsExercises
//  Created by hg on 03/07/2022.
//
//  |Median of Two Sorted Arrays|
//  |Sorted Array|Binary Search|
//  Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//  The overall run time complexity should be O(log (m+n)).
//

import Foundation

class MediumTwoSortedArrays {
    
    // O(log(min(n, m))) time
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let (small, large) = nums1.count < nums2.count ? (nums1, nums2) : (nums2, nums1)
        let count = nums1.count + nums2.count
        let half = count / 2
        var left = 0
        var right = small.count - 1
        
        while true {
            let sPartIndex = left + Int((Double(right - left) / 2).rounded(.down))
            let lPartIndex = half - sPartIndex - 2
            let sLeft = sPartIndex >= 0 ? small[sPartIndex] : Int.min
            let sRight = sPartIndex + 1 < small.count ? small[sPartIndex + 1] : Int.max
            let lLeft = lPartIndex >= 0 ? large[lPartIndex] : Int.min
            let lRight = lPartIndex + 1 < large.count ? large[lPartIndex + 1] : Int.max
            
            if sLeft <= lRight && lLeft <= sRight {
                if count.isMultiple(of: 2) {
                    return Double(max(sLeft, lLeft) + min(sRight, lRight)) / 2
                }
                else {
                    return Double(min(sRight, lRight))
                }
            }
            else if sLeft > lRight {
                right = sPartIndex - 1
            }
            else {
                left = sPartIndex + 1
            }
        }
    }
    
}
