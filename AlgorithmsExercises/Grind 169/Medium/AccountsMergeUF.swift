//
//  AccountsMergeUF.swift
//  AlgorithmsExercises
//  Created by hg on 04/06/2022.
//
//  |Accounts Merge|
//  |Union Find|
//  Given a list of accounts where each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.
//  Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some common email to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.
//  After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.
//

import Foundation

class AccountsMergeUF {
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        let uf = UF(size: accounts.count)
        var emailComponentMap = [String: Int]()
        
        for (index, account) in accounts.enumerated() {
            for email in account.dropFirst() {
                if let component = emailComponentMap[email] {
                    uf.union(component, index)
                }
                else {
                    emailComponentMap[email] = index
                }
            }
        }
        
        var components = [Int: [String]]()
        for (email, component) in emailComponentMap {
            let parent = uf.find(component)
            components[parent, default: []].append(email)
        }
        
        var mergedAccounts = [[String]]()
        for (key, value) in components {
            let mergedAccount = [accounts[key][0]] + value.sorted()
            mergedAccounts.append(mergedAccount)
        }
        
        return mergedAccounts
    }
    
    private class UF {
        private var parent: [Int]
        private var rank: [UInt8]
        
        init(size: Int) {
            parent = [Int]()
            rank = [UInt8]()
            
            for i in 0..<size {
                parent.append(i)
                rank.append(0)
            }
        }
        
        func union(_ p: Int, _ q: Int) {
            let i = find(p)
            let j = find(q)
            
            if i == j { return }
            
            if rank[i] < rank[j] {
                parent[i] = j
            }
            else if rank[i] > rank[j] {
                parent[j] = parent[i]
            }
            else {
                parent[j] = i
                rank[i] += 1
            }
        }
        
        func find(_ p: Int) -> Int {
            var i = p
            
            while i != parent[i] {
                parent[i] = parent[parent[i]]
                i = parent[i]
            }
            
            return i
        }
    }
    
}
