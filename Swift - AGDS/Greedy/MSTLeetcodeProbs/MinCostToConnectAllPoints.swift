//
//  MinCostToConnectAllPoints.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-23.
//

import Foundation
//[0,0],[2,2],[3,10],[5,2],[7,0]
// 1. count the distance of all points connecting to each other
// 2. use (UF) Kruskal's AG

var parentIndex = [Int]()

func find(_ vi: Int) -> Int {
   if parentIndex[vi] != vi {  // path compression; return root of the set
       parentIndex[vi] = find(parentIndex[vi])
       return parentIndex[vi]
   } else {
       return vi // root
   }
}

func minCostConnectPoints(_ points: [[Int]]) -> Int {
  var edges = [(v1i: Int, v2i: Int, w: Int)]()
  
  parentIndex = Array(0...points.count-1)
  
  // count each distance between two points
  for i in 0..<points.count - 1 {
    let point1 = points[i]
    let point1_x = point1[0], point1_y = point1[1]
    
    for j in i+1..<points.count {
      let point2 = points[j]
      edges.append(((i, j, abs(point1_x - point2[0]) + abs(point1_y - point2[1]))))
    }
  }
  // sort from smallest to largest
  edges.sort { $0.w < $1.w }
  print(edges)
  
  // Find and Union
  var minCost = 0
  
  for edge in edges {
//    print("edge: \(edge)")
    let root1 = find(edge.v1i) // return root index
//    print("root1: \(root1)")
//    print("edge.v1i: \(edge.v1i)")
//    print("parent edge.v1i: \(parentIndex[edge.v1i])")
    let root2 = find(edge.v2i) // return root index
//    print("root2: \(root2)")
//    print("edge.v2i: \(edge.v2i)")
//    print("parent edge.v2i: \(parentIndex[edge.v2i])")
    
    
    if root1 != root2 { // not in the same tree, join them
      minCost += edge.w
//      print("minCost: \(edge.w), \(minCost)")
      parentIndex[root2] = root1 // Union
    }
//    print("-----------------------")
  }
  
  return minCost

}




