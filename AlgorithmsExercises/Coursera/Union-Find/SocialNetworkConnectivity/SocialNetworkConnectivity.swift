//
//  SocialNetworkConnectivity.swift
//  UnionFindExercises
//
//  Created by hg on 03/10/2020.
//
//  Social network connectivity.
//  Given a social network containing n members and a log file containing m timestamps at which times pairs of members formed friendships, design an algorithm to determine the earliest time at which all members are connected (i.e., every member is a friend of a friend of a friend ... of a friend).
//  Assume that the log file is sorted by timestamp and that friendship is an equivalence relation. The running time of your algorithm should be mlogn or better and use extra space proportional to n.
//

import Foundation
import SwiftAlgorithms

class SocialNetworkConnectivity {
    
    let members: Int
    let logs: [SNCTimestamp]
    let unionFind: WeightedQuickUnionUF
    
    init(members: Int, logs: [SNCTimestamp]) {
        self.members = members
        self.logs = logs
        self.unionFind = WeightedQuickUnionUF(length: members)
    }
    
    func earliestAllConnected() -> String? {
        for log in logs {
            unionFind.union(log.userId1, log.userId2)
            if isEveryMemberConnected() { return log.date }
        }
        
        return nil
    }
    
    private func isEveryMemberConnected() -> Bool {
        if members < 2 { return true }
        
        var isConnected = true
        
        for i in 0..<members - 1 where isConnected {
            isConnected = unionFind.connected(i, i + 1) && isConnected
        }
        
        return isConnected
    }
    
}
