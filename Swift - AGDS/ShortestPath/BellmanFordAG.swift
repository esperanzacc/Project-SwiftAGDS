//
//  BellmanFordAG.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-28.
//

import Foundation

func bellmanFord(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int] {
  var d = [Int](repeating: Int.max, count: n + 1)
  d[src] = 0
  
  for _ in 0..<n-1 {
    for edge in edges {
      if d[edge.v] > d[edge.u] + edge.w {
        d[edge.v] = d[edge.u] + edge.w
      }
    }
  }
  return d
}


/// Shortest Path Faster Algorithm (SPFA)
///  If a distance to a vertex changes, you keep it in the Queue.
///  We use check array to see whether a vertex is in the Queue or not.
///  Time Complexity: on average O(E)
/// - Parameters:
///   - edges: edge list
///   - n: the number of vertices
///   - src: the source vertex
/// - Returns: the distance array (shortest path)
/// 
func shortestPathFasterAlgorithm(_ edges: [(u: Int, v: Int, w: Int)], _ n: Int, _ src: Int) -> [Int] {
  var adj = [[(v: Int, w: Int)]](repeating: [(v: Int, w: Int)](), count: n + 1)
  var dist = [Int](repeating: Int.max, count: n + 1)
  var check = [Bool](repeating: false, count: n + 1)
  
  for edge in edges {
    adj[edge.u].append((v: edge.v, w: edge.w))
  }
  
  let q = Queue<Int>() // store the vertex I need to check again
  q.enqueue(item: src)
  dist[src] = 0
  check[src] = true
  
  while !q.isEmpty() {
    let u = q.dequeue()!
    check[u] = false
    for edge in adj[u] {
      if dist[edge.v] > dist[u] + edge.w {
        dist[edge.v] = dist[u] + edge.w
        if !check[edge.v] {
          q.enqueue(item: edge.v)
          check[edge.v] = true
        }
      }
    }
  }
  return dist
}
