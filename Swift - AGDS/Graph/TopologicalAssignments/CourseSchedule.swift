//
//  CourseSchedule.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-08.
//

import Foundation

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
  var adj = [[Int]](repeating: [Int](), count: numCourses)
    print(adj)
    var indegrees = [Int](repeating: 0, count: numCourses)
    print(indegrees)

    for i in 0..<prerequisites.count {
      let u = prerequisites[i][0]
  //    print(u)
      let v = prerequisites[i][1]
  //    print(v)
    
      adj[u].append(v)
      indegrees[v] += 1
    }
    
    // Topological Sort - using BFS
    let q = Queue<Int>()
    // checking the intial state
  //  print("want to print q")
    for v in 0..<numCourses {
  //    print(v)
      if indegrees[v] == 0 {
  //      print(v)
        q.enqueue(item: v)
        print(q)
      }
    }

    // BFS
    var count = numCourses
    
    while !q.isEmpty() {
      let u = q.dequeue()!
      count -= 1
      print("u is \(u)")
      
      for v in adj[u] {
  //      print(prerequisites[u])
        indegrees[v] -= 1
        if indegrees[v] == 0 {
          q.enqueue(item: v)
        }
      }
    }
    
    return count == 0 ? true : false
    
}


//func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
//  
//  // check there is a cycle or not
//
//  var visited = [Bool](repeating: false, count: numCourses + 1)
//  print(visited)
//  let startNum = prerequisites[0][0] // -> 1
//  
//  
//  return dfs(start: startNum, visited: &visited)
//  
//  func dfs(start: Int, visited: inout [Bool]) -> Bool {
//    visited[start] = true
//    // base case
//    if visited[start] {
//      return false
//    }
//    
//    for i in 1..<prerequisites.count - 1 {
//      if prerequisites[0][1] == prerequisites[i][0] {
//        dfs(start: prerequisites[i][0], visited: &visited)
//      }
//    }
//    return true
//  }
//}
