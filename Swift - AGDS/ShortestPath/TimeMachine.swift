//
//  TimeMachine.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-28.
//

import Foundation

func timeMachine() {
  let first = readLine()!.split(separator: " ").map { Int($0)! }
  let n = first[0]
  let m = first[1]
  var edges = [(u: Int, v: Int, w: Int)]()
  var dist = [Int](repeating: Int.max, count: n + 1)
  print(dist)
  dist[1] = 0
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((u: edge[0], v: edge[1], w: edge[2]))
  }
  print(edges)
  
  var negativeCycle = false
  for i in 0..<n {
    for edge in edges {
      print(edge)
      if dist[edge.u] != Int.max && dist[edge.v] > dist[edge.u] + edge.w { // I can relax the edge
        dist[edge.v] = dist[edge.u] + edge.w
        print("edge.v: \(dist[edge.v])")
        print(dist)
        if i == n - 1 { // nth iteration
          negativeCycle = true
        }
      }
    }
  }
  if negativeCycle {
    print(negativeCycle)
    print(-1)
  } else {
    for v in 2...n {
      if dist[v] == Int.max {
        dist[v] = -1
      }
      print(dist[v])
    }
  }
}
//3 4
//1 2 4
//1 3 3
//2 3 -1
//3 1 -2

//3 4
//1 2 4
//1 3 3
//2 3 -4
//3 1 -2
