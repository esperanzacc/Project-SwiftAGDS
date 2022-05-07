//
//  NetworkDelayTime.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-26.
//

import Foundation

func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
  var adjList = [[(v: Int, w: Int)]](repeating: [(Int, Int)](), count: n + 1)
  print(adjList)
  for time in times {
    adjList[time[0]].append((v: time[1], w: time[2]))
  }
  print(adjList)
  
  let d = dijkstraPQ(adjList, k)
  print(d)
  
  var res = 0
  for i in 1...n {
    if res < d[i] {
      res = d[i]
    }
  }
  
  return res < 101 ? res : -1
}
