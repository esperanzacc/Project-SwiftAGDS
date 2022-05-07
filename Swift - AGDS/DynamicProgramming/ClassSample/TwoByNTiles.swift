//
//  TwoByNTiles.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-03.
//

import Foundation

// 1. define the subproblem
// - d[N] = the number of ways to fill up 2 x N tiles
// 2. guessing
// - "how it ends"
// 3. recurrence relation
// - d[n] = d[n - 1] + d[n - 2]
func twoByNTiles(_ n: Int) -> Int {
  if n <= 2 { return n }
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 1
  d[2] = 2
  for i in 3...n {
    d[i] = d[i - 1] + d[i - 2]
  }
  return d[n]
}
