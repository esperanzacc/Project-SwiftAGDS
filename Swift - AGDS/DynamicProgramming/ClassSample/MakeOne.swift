//
//  MakeOne.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-03.
//

import Foundation
/// 2. Make One
/// - Parameter n: the given integer
/// - Returns: the minimum number of operations used to make 1

func makeOne(_ n: Int) -> Int {
  // 1. define the subproblem
  // d[n] = the minimum number of operations used to make 1 for n
  // d[1] = 0
  // d[2] = 1
  
  // 2. guess to find the relationship between subproblems
  // look how it starts
  // N -> N/3 -> ... -> 1
  // N -> N/2 -> ... -> 1
  // N -> N/1 -> ... -> 1
  
  // 3. recurrence relation
  // d[N] = min(d[N/3] + 1, d[N/2] + 1, d[N-1] + 1)
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 0
  for i in 2...n {
    d[i] = d[i - 1] + 1
    if i % 2 == 0 && d[i] > d[i / 2] + 1 {
      d[i] = d[i / 2] + 1
    }
    if i % 3 == 0 && d[i] > d[i / 3] + 1 {
      d[i] = d[i / 3] + 1
    }
  }
  return d[n]

}

