//
//  FirstBadVersion.swift
//  AlgorithmsExercises
//  Created by hg on 26/05/2022.
//
//  |First Bad Version|
//  |Binary Search|
//  You are a product manager and currently leading a team to develop a new product.
//  Unfortunately, the latest version of your product fails the quality check.
//  Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//  Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//  You are given an API bool isBadVersion(version) which returns whether version is bad.
//  Implement a function to find the first bad version.
//  You should minimize the number of calls to the API.
//

import Foundation

class FirstBadVersion {
    
    func solve(_ n: Int) -> Int {
        var lowerBound = 0
        var upperBound = n - 1
        
        while lowerBound <= upperBound {
            let mid = lowerBound + (upperBound - lowerBound) / 2
            
            if isBadVersion(mid) {
                upperBound = mid - 1
            } else {
                lowerBound = mid + 1
            }
        }
        
        return lowerBound
    }
    
    private func isBadVersion(_ version: Int) -> Bool {
        let versions = [false, false, false, true, true, true]
        return versions[version]
    }
    
}
