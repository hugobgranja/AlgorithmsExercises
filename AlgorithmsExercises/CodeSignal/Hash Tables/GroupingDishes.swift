//
//  GroupingDishes.swift
//  AlgorithmsExercises
//
//  Created by hg on 02/05/2022.
//
//  You are given a list dishes, where each element consists of a list of strings beginning with the name of the dish, followed by all the ingredients used in preparing it.
//  You want to group the dishes by ingredients, so that for each ingredient you'll be able to find all the dishes that contain it (if there are at least 2 such dishes).
//  Return an array where each element is a list beginning with the ingredient name, followed by the names of all the dishes that contain this ingredient.
//  The dishes inside each list should be sorted lexicographically, and the result array should be sorted lexicographically by the names of the ingredients.
//
//  Example
//
//  For
//  dishes = [["Salad", "Tomato", "Cucumber", "Salad", "Sauce"],
//            ["Pizza", "Tomato", "Sausage", "Sauce", "Dough"],
//            ["Quesadilla", "Chicken", "Cheese", "Sauce"],
//            ["Sandwich", "Salad", "Bread", "Tomato", "Cheese"]]
//
//  The output should be
//           [["Cheese", "Quesadilla", "Sandwich"],
//            ["Salad", "Salad", "Sandwich"],
//            ["Sauce", "Pizza", "Quesadilla", "Salad"],
//            ["Tomato", "Pizza", "Salad", "Sandwich"]]
//

import Foundation

class GroupingDishes {
    
    func solve(dishes: [[String]]) -> [[String]] {
        var dict = [String: [String]]()

        for dish in dishes {
            let name = dish[0]
            for ingredient in dish.dropFirst() {
                dict[ingredient, default: []].append(name)
            }
        }

        return dict.keys
            .filter { dict[$0]!.count > 1 }
            .sorted()
            .map { [$0] + dict[$0]!.sorted() }
    }
    
}
