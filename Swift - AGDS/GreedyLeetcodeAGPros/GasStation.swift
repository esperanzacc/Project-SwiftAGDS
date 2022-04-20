//
//  GasStation.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-19.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
  
  var total_tank = 0
  var tank = 0
  var start = 0
  
  for i in 0..<gas.count {
    total_tank += (gas[i] - cost[i])
    tank += (gas[i] - cost[i])
    if tank < 0 {
      start = i + 1
//      print(start)
      tank = 0
//      print(total_tank)
    }
//    print(tank)
  }
  
  if total_tank >= 0 {
    return start
  } else {
    return -1
  }
  
}

