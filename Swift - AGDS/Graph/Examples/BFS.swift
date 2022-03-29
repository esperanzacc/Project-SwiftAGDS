//
//  BFS.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-21.
//

import Foundation

func adjacencyListBFS() {
  let firstLine = readLine()!.split(separator: " ")
  print(firstLine)
  // number of vertices
  let n = Int(firstLine[0])!
  print(n)
  // number of edges
  let m = Int(firstLine[1])!
  print(m)
  
  // adjacency list
  var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    let u = Int(edge[0])!
    let v = Int(edge[1])!
    let w = Int(edge[2])!
    adjList[u].append((v, w))
    adjList[v].append((u, w)) // undirected graph
  }
   
  // BFS - starting from vertex 1
  var visited = [Bool](repeating: false, count: n + 1)
  let queue = Queue<Int>()
  queue.enqueue(item: 1) // starting vertex 1
  visited[1] = true
  
  while !queue.isEmpty() {
    let u = queue.dequeue()!  // take out Queuejkl
    print(u)
    for (v, _) in adjList[u] {
      if !visited[v] { // check visit or not
        queue.enqueue(item: v)
        visited[v] = true
      }
      
    }
    
  }
}
