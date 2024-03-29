//
//  CourseSchedule.swift
//  AlgorithmsExercises
//  Created by hg on 31/05/2022.
//
//  |Course Schedule|
//  |Graph|
//  There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
//  You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
//  For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
//  Return true if you can finish all courses. Otherwise, return false.
//

import Foundation

class CourseSchedule {
    
    func solve(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        
        for prerequisite in prerequisites {
            adjacencyList[prerequisite[1]].append(prerequisite[0])
        }
        
        return !hasCycle(adjacencyList)
    }
    
    private func hasCycle(_ adjacencyList: [[Int]]) -> Bool {
        var visited = [Bool](repeating: false, count: adjacencyList.count)
        var visiting = [Bool](repeating: false, count: adjacencyList.count)
        var hasCycle = false
        
        func dfs(_ v: Int) {
            visiting[v] = true
            visited[v] = true
            
            for w in adjacencyList[v] {
                guard !hasCycle else { return }
                if !visited[w] { dfs(w) }
                else if visiting[w] { hasCycle = true }
            }
            
            visiting[v] = false
        }
        
        for vertex in adjacencyList.indices {
            guard !hasCycle else { return true }
            if !visited[vertex] { dfs(vertex) }
        }
        
        return hasCycle
    }
    
}
