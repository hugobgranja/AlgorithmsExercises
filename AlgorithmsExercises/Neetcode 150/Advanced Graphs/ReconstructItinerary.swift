//
//  ReconstructItinerary.swift
//  AlgorithmsExercises
//  Created by hg on 27/08/2022.
//
//  |Reconstruct Itinerary|
//  |Graph|DFS|Eulerian Circuit|
//  You are given a list of airline tickets where tickets[i] = [fromi, toi] represent the departure and the arrival airports of one flight.
//  Reconstruct the itinerary in order and return it.
//  All of the tickets belong to a man who departs from "JFK", thus, the itinerary must begin with "JFK".
//  If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.
//  For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
//  You may assume all tickets form at least one valid itinerary.
//  You must use all the tickets once and only once.
//

import Foundation

class ReconstructItinerary {
    
    // Hierholzer's Algorithm
    func findItinerary(_ tickets: [[String]]) -> [String] {
        func dfs(_ source: String) {
            while let destination = graph[source]?.popLast() {
                dfs(destination)
            }
            
            path.append(source)
        }
        
        var graph = tickets.reduce(into: [String: [String]]()) { dict, ticket in
            dict[ticket[0], default: []].append(ticket[1])
        }
        
        for key in graph.keys {
            graph[key]?.sort(by: >)
        }
        
        var path = [String]()
        dfs("JFK")
        return path.reversed()
    }
    
}
