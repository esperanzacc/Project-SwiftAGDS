//
//  TopologicalSort.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-07.
//

import Foundation

func topologicalSort() {
  
  let firstLine = readLine()!.split(separator: " ").map { Int($0) }
  let N = firstLine[0]! // vertices
  let M = firstLine[1]! // edges
  
  var adj = [[Int]](repeating: [Int](), count: N + 1)
  var indegrees = [Int](repeating: 0, count: N + 1)
  
  for _ in 0..<M { // M edges
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
//    print(edge)
    let u = edge[0]
//    print("The \(u)time is \(u)")
    let v = edge[1]
//    print("The \(v)time is \(v)")
    adj[u].append(v) // DAG
//    print(adj)
    indegrees[v] += 1
//    print(indegrees)
  }
  print(adj)
  
  // Topological Sort - using BFS
  let q = Queue<Int>()
  // checking the initial state
  for v in 1...N {
//    print("v: \(v)")
    if indegrees[v] == 0 {
//      print(indegrees[v])
      q.enqueue(item: v)
    }
  }
  
  // BFS
  while !q.isEmpty() {
    let u = q.dequeue()!
    print("u:\(u)")
//    print(u) // print in topological order
    for v in adj[u] {
      print(adj[u])
      print(v)
      indegrees[v] -= 1 // decrement indegree of all connected vertices from u
      if indegrees[v] == 0 {
        q.enqueue(item: v)
      }
    }
  }
   
}
//9 10
//1 4
//1 9
//2 4
//3 5
//4 7
//5 7
//5 6
//7 6
//6 8
//7 8
