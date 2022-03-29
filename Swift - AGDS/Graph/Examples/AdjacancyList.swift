//
//  AdjacancyList.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-21.
//

import Foundation

func adjacencyListRepresentation() {
  let firstLine = readLine()!.split(separator: " ")
  print(firstLine)
  // number of vertices
  let n = Int(firstLine[0])!
  print(n)
  // number of edges
  let m = Int(firstLine[1])!
  print(m)
  
  // adjacency list
  var adjList = [[Int]](repeating: [], count: n + 1)
  
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    print(edge)
    let u = Int(edge[0])!
    print("m: \(u)")
    let v = Int(edge[1])!
    print(v)
    adjList[u].append(v)
    adjList[v].append(u) // undirected graph
  }
   
  for(u, row) in adjList.enumerated() {
    print("A[\(u)] = \(row)")
  }
  
}

func adjacencyListWeightedRepresentation() {
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
    print(edge)
    let u = Int(edge[0])!
    print("m: \(u)")
    let v = Int(edge[1])!
    print(v)
    let w = Int(edge[2])!
    adjList[u].append((v, w))
    adjList[v].append((u, w)) // undirected graph
  }
   
  for(u, row) in adjList.enumerated() {
    print("A[\(u)] = \(row)")
  }
  
}

