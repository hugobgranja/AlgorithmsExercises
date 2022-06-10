//
//  CourseScheduleII.swift
//  AlgorithmsExercises
//  Created by hg on 08/06/2022.
//
//  |Course Schedule II|
//  |Graph|DFS|BFS|Topological Sort|
//  There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1.
//  You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.
//  For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
//  Return the ordering of courses you should take to finish all courses.
//  If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.
//

import Foundation

class CourseScheduleII {
    
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        
        for prerequisite in prerequisites {
            adjacencyList[prerequisite[1]].append(prerequisite[0])
        }
        
        guard !hasCycle(adjacencyList) else { return [] }
        return findTopologicalOrder(adjacencyList)
    }
    
    private func hasCycle(_ adjacencyList: [[Int]]) -> Bool {
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
        
        var visited = [Bool](repeating: false, count: adjacencyList.count)
        var visiting = [Bool](repeating: false, count: adjacencyList.count)
        var hasCycle = false
        
        for vertex in adjacencyList.indices {
            guard !hasCycle else { return true }
            if !visited[vertex] { dfs(vertex) }
        }
        
        return hasCycle
    }
    
    private func findTopologicalOrder(_ adjacencyList: [[Int]]) -> [Int] {
        func dfs(_ v: Int) {
            visited[v] = true
            
            for adjacent in adjacencyList[v] {
                if !visited[adjacent] { dfs(adjacent) }
            }
            
            order.append(v)
        }
        
        var visited = [Bool](repeating: false, count: adjacencyList.count)
        var order = [Int]()
        
        for vertex in 0..<adjacencyList.count {
            if !visited[vertex] { dfs(vertex) }
        }
        
        return order.reversed()
    }
    
    // Merged cycle detection with finding topological order
    func findOrder2(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        
        for prerequisite in prerequisites {
            adjacencyList[prerequisite[1]].append(prerequisite[0])
        }
        
        return findTopologicalOrder2(adjacencyList)
    }
    
    private func findTopologicalOrder2(_ adjacencyList: [[Int]]) -> [Int] {
        func dfs(_ v: Int) {
            visiting[v] = true
            visited[v] = true
            
            for w in adjacencyList[v] {
                guard !hasCycle else { return }
                if !visited[w] { dfs(w) }
                else if visiting[w] { hasCycle = true }
            }
            
            visiting[v] = false
            order.append(v)
        }
        
        var visited = [Bool](repeating: false, count: adjacencyList.count)
        var visiting = [Bool](repeating: false, count: adjacencyList.count)
        var order = [Int]()
        var hasCycle = false
        
        for vertex in adjacencyList.indices {
            guard !hasCycle else { return [] }
            if !visited[vertex] { dfs(vertex) }
        }
        
        return order.reversed()
    }
    
    // Indegree approach
    func findOrderIndegree(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        var indegree = [Int](repeating: 0, count: numCourses)
        
        for prerequisite in prerequisites {
            adjacencyList[prerequisite[1]].append(prerequisite[0])
            indegree[prerequisite[0]] += 1
        }
        
        var queue = (0..<numCourses).filter { indegree[$0] == 0 }
        var order = [Int]()
        
        while let v = queue.first {
            queue.removeFirst()
            order.append(v)
            
            for adjacent in adjacencyList[v] {
                indegree[adjacent] -= 1
                if indegree[adjacent] == 0 {
                    queue.append(adjacent)
                }
            }
        }
        
        return order.count == numCourses ? order : []
    }
    
}
