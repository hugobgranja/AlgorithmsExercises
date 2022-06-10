//
//  PowXN.swift
//  AlgorithmsExercises
//  Created by hg on 17/06/2022.
//  |Pow(x,n)|
//  |Math|Recursion|
//  Implement pow(x, n), which calculates x raised to the power n.
//

import Foundation

class PowXN {
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        func positivePow(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            var result = positivePow(x, n / 2)
            result *= result
            return n.isMultiple(of: 2) ? result : x * result
        }
        
        if x == 0 { return 0 }
        let result = positivePow(x, n)
        return n >= 0 ? result : 1 / result
    }
    
    func myPow2(_ x: Double, _ n: Int) -> Double {
        func positivePow(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            let result = positivePow(x * x, n / 2)
            return n.isMultiple(of: 2) ? result : x * result
        }
        
        if x == 0 { return 0 }
        let result = positivePow(x, n)
        return n >= 0 ? result : 1 / result
    }
    
    func myPow3(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        if n < 0 { return 1 / myPow(x, -n) }
        if n.isMultiple(of: 2) { return myPow(x * x, n / 2) }
        return x * myPow(x, n - 1)
    }
    
}
