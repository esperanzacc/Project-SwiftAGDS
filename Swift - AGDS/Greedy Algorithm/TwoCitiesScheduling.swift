//
//  TwoCitiesScheduling.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-19.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
  
  if costs.count == 0 {
    return 0
  }
        
  if costs.count == 1 {
    return min(costs[0][0], costs[0][1])
  }
  
  // 1. count each difference between two cities and sort by <
  
  let diffSortArr = costs.sorted { ($0[1] - $0[0]) < ($1[1] - $1[0]) }
  
  print(diffSortArr)
  
  // 2. take the first n to b city, and take the last n to a bity
  
  var miniCosts = 0
  let halfPeople = costs.count / 2
  
  for i in 0..<halfPeople {
    miniCosts += diffSortArr[i][1]
  }
  
  for i in halfPeople..<costs.count {
    miniCosts += diffSortArr[i][0]
  }
  
  print(miniCosts)
  return miniCosts
}
