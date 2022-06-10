//
//  IntegerToRoman.swift
//  AlgorithmsExercises
//  Created by hg on 28/05/2022.
//
//  |Integer to Roman|
//  |String|Hash Table|

import Foundation

class IntegerToRoman {
    
    let values = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    let numerals = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]

    func solve(_ num: Int) -> String {
        var num = num
        var result = ""
        
        for (index, value) in values.enumerated() {
            while num >= value {
                result += numerals[index]
                num -= value
            }
        }
        
        return result
    }
    
}
