//
//  TaxicabNumbers.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/12/2020.
//
//  Taxicab numbers.
//  A taxicab number is an integer that can be expressed as the sum of two cubes of positive integers in two different ways: a^3 + b^3 = c^3 + d^3.
//  For example, 17291729 is the smallest taxicab number: 9^3 + 10^3 = 1^3 + 12^3.
//  Design an algorithm to find all taxicab numbers with a, b, c, and d less than n.
//  Version 1: Use time proportional to n^2 * logn and space proportional to n^2.
//  Version 2: Use time proportional to n^2 * logn and space proportional to n.
//

import Foundation
import SwiftAlgorithms

class TaxicabNumber: Comparable {
    
    let a: Int
    let b: Int
    let sum: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        self.sum = Int(pow(Double(a), 3) + pow(Double(b), 3))
    }
    
    static func < (lhs: TaxicabNumber, rhs: TaxicabNumber) -> Bool {
        return lhs.sum < rhs.sum
    }
    
    static func == (lhs: TaxicabNumber, rhs: TaxicabNumber) -> Bool {
        return lhs.a == rhs.b && lhs.b == rhs.b
    }
    
}

class TaxicabNumbers {
    
    func findV1(n: Int) -> [Int] {
        var sums = [Int]()
        
        for i in 0..<n {
            for j in i..<n {
                let sum = pow(Double(i), 3) + pow(Double(j), 3)
                sums.append(Int(sum))
            }
        }
        
        let heapsort = HeapSort()
        heapsort.sort(&sums)
        
        var duplicates = [Int]()
        var i = 0
        while i < sums.count - 1 {
            if sums[i] == sums[i + 1] {
                duplicates.append(sums[i])
                i += 2
            }
            else {
                i += 1
            }
        }
        
        return duplicates
    }
    
    func findV2(n: Int) -> [Int] {
        let pq = MinBinaryHeap<TaxicabNumber>()
        
        for i in 1...n {
            pq.enqueue(TaxicabNumber(a: i, b: i))
        }
        
        var duplicates = [Int]()
        var previous = TaxicabNumber(a: 0, b: 0)
        
        while let current = pq.dequeue() {
            if previous.sum == current.sum {
                duplicates.append(previous.sum)
            }
            
            previous = current
            
            if current.b < n {
                pq.enqueue(TaxicabNumber(a: current.a, b: current.b + 1))
            }
        }
        
        return duplicates
    }
    
}
