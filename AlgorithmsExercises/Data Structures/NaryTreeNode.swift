//
//  NaryTreeNode.swift
//  AlgorithmsExercises
//  Created by hg on 09/06/2022.
//

import Foundation

class NaryTreeNode {
    
    var val: Int
    var children: [NaryTreeNode]
    
    init(_ value: Int) {
        self.val = value
        self.children = []
    }
    
}
