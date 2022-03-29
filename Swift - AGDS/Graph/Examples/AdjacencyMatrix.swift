//
//  AdjacencyMatrix.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-21.
//

import Foundation

func adjacencyMatrixRepresentation() {
  let firstLine = readLine()!.split(separator: " ")
  print(firstLine)
  // number of vertices
  let n = Int(firstLine[0])!
  print(n)
  // number of edges
  let m = Int(firstLine[1])!
  print(m)
  
  var adjMatrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
  print("Here is \(adjMatrix)")
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ")
    print(edge)
    let u = Int(edge[0])!
    print("m: \(u)")
    let v = Int(edge[1])!
    print(v)
    let w = Int(edge[2])!
    print(w)
    adjMatrix[u - 1][v - 1] = w
    print(w)// -1 : index from 0
    adjMatrix[v - 1][u - 1] = w //undirected graph
  }
  
  for row in adjMatrix {
    print(row)
  }
}
