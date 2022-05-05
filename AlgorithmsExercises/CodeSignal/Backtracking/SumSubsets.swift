//
//  SumSubsets.swift
//  AlgorithmsExercises
//
//  Created by hg on 19/05/2022.
//
//  Given a sorted array of integers arr and an integer num, find all possible unique subsets of arr that add up to num.
//  Both the array of subsets and the subsets themselves should be sorted in lexicographical order.
//

import Foundation

class SumSubsets {
    
    func solve<T: Collection>(arr: T, num: Int) -> [[Int]] where T.Element == Int {
        if num == 0 { return [[]] }
        else if let first = arr.first, first > num { return [] }
        
        var result = [[Int]]()
        var index = arr.startIndex
        
        while index < arr.endIndex && arr[index] <= num {
            let nextIndex = arr.index(after: index)
            let nextArr = arr.suffix(from: nextIndex)
            let subresults = solve(arr: nextArr, num: num - arr[index])
            
            for subresult in subresults{
                let newResult = [arr[index]] + subresult
                
                if !result.contains(newResult) {
                    result.append([arr[index]] + subresult)
                }
            }
            
            index = nextIndex
        }
        
        return result
    }
    
}
