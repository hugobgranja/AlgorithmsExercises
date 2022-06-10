//
//  AccountsMergeGraph.swift
//  AlgorithmsExercises
//  Created by hg on 04/06/2022.
//
//  |Accounts Merge|
//  |Graph|DFS|
//  Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.
//  Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.
//  After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.
//

import Foundation

class AccountsMergeGraph {
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let adjacencyList = createAdjacencyList(accounts)
        var visited = Set<String>()
        
        func dfs(_ vertex: String, _ mergedAccount: inout [String]) {
            visited.insert(vertex)
            mergedAccount.append(vertex)
            
            for neighbor in adjacencyList[vertex, default: []] {
                if !visited.contains(neighbor) { dfs(neighbor, &mergedAccount) }
            }
        }
        
        var mergedAccounts = [[String]]()
        for account in accounts {
            let name = account[0]
            let firstEmail = account[1]
            var mergedAccount = [String]()
            
            if !visited.contains(firstEmail) {
                dfs(firstEmail, &mergedAccount)
                mergedAccount.sort()
                mergedAccount.insert(name, at: 0)
                mergedAccounts.append(mergedAccount)
            }
        }
        
        return mergedAccounts
    }
    
    private func createAdjacencyList(_ accounts: [[String]]) -> [String: [String]] {
        var adjacencyList = [String: [String]]()
        
        for account in accounts {
            let firstEmail = account[1]
            
            for email in account.dropFirst(2) {
                adjacencyList[firstEmail, default: []].append(email)
                adjacencyList[email, default: []].append(firstEmail)
            }
        }
        
        return adjacencyList
    }
    
}
