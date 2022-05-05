//
//  FindProfession.swift
//  AlgorithmsExercises
//
//  Created by hg on 07/05/2022.
//
//  Consider a special family of Engineers and Doctors. This family has the following rules:
//  Everybody has two children.
//  The first child of an Engineer is an Engineer and the second child is a Doctor.
//  The first child of a Doctor is a Doctor and the second child is an Engineer.
//  All generations of Doctors and Engineers start with an Engineer.
//  Given the level and position of a person in the ancestor tree above, find the profession of the person.
//


import Foundation

class FindProfession {
    
    func solve(level: Int, pos: Int) -> String {
        if level == 1 { return "Engineer" }
        
        if solve(level: level - 1, pos: (pos + 1) / 2) == "Doctor" {
            return pos.isMultiple(of: 2) ? "Engineer" : "Doctor"
        }
        else {
            return pos.isMultiple(of: 2) ? "Doctor" : "Engineer"
        }
    }
    
    func solve2(level: Int, pos: Int) -> String {
        return (pos - 1).nonzeroBitCount.isMultiple(of: 2) ? "Engineer" : "Doctor"
    }
    
}
