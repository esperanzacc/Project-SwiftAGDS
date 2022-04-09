//
//  CourseSchedule2.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-08.
//

import Foundation

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
 
  var adj = [[Int]](repeating: [Int](), count: numCourses)
//  print(adj)
  var indegrees = [Int](repeating: 0, count: numCourses)
//  print(indegrees)
  var answer = [Int]()
 

  for i in 0..<prerequisites.count {
    let u = prerequisites[i][1]
    print(u)
    let v = prerequisites[i][0]
    print(v)
  
    adj[u].append(v)
    indegrees[v] += 1
  }
  
  print(adj)
  print(indegrees)
  
  // Topological Sort - using BFS
  let q = Queue<Int>()
  // checking the intial state
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
    answer.append(u)
    
    for v in adj[u] {
      indegrees[v] -= 1
      if indegrees[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
  
  return count == 0 ? answer : []
}
