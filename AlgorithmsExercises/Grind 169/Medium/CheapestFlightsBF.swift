//
//  CheapestFlightsBF.swift
//  AlgorithmsExercises
//  Created by hg on 18/06/2022.
//
//  |Cheapest Flights Within K Stops|
//  |Graph|Shortest Path|Bellman-Ford SP|
//  There are n cities connected by some number of flights.
//  You are given an array flights where flights[i] = [fromi, toi, pricei] indicates that there is a flight from city fromi to city toi with cost pricei.
//  You are also given three integers src, dst, and k, return the cheapest price from src to dst with at most k stops. If there is no such route, return -1.
//

import Foundation

class CheapestFlightsBF {
    
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
        var costTo = [Int](repeating: -1, count: n)
        costTo[src] = 0
        
        for _ in 0...k {
            var tmpCostTo = costTo
            
            for flight in flights {
                let source = flight[0]
                let dest = flight[1]
                let cost = flight[2]
                
                if costTo[source] == -1 { continue }
                
                let destCost = costTo[source] + cost
                if tmpCostTo[dest] == -1 || destCost < tmpCostTo[dest] {
                    tmpCostTo[dest] = destCost
                }
            }
            
            costTo = tmpCostTo
        }
        
        return costTo[dst]
    }
    
}
