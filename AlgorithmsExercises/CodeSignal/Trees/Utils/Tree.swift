//
//  Tree.swift
//  AlgorithmsExercises
//
//  Created by hg on 06/05/2022.
//

import Foundation

class Tree<T> {
    
     var value: T
     var left: Tree<T>?
     var right: Tree<T>?
    
     init(_ x: T) {
         self.value = x
         self.left = nil
         self.right = nil
     }
    
 }
