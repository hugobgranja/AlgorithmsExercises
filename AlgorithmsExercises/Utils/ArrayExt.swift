//
//  ArrayExt.swift
//  AlgorithmsExercises
//
//  Created by hg on 27/04/2022.
//

import Foundation

extension Array where Element == Array<Int> {
    
    func prettyPrint() {
        for array in self {
            for element in array {
                print(element, terminator: " ")
            }
            print("")
        }
        print("")
    }
    
}
