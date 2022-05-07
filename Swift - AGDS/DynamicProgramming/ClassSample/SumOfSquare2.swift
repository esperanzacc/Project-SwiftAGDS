//
//  MinSquSUm.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

// 1. d[N] = the minimum number of squares needed to sum to N.
// 2. recurrence relation
//    d[N] = min(d[N - j * j] + 1) where 1 <= j * j <= N
func minSquareSum(_ n: Int) -> Int {
  var d = [Int](repeating: 0, count: n + 1)
  for i in 1...n {
    d[i] = i
    print(d)
    var j = 1
    while j * j <= i {
      print(i, j)
      print(d[i - j * j])
      if d[i] > d[i - j * j] + 1 {
        d[i] = d[i - j * j] + 1
      }
      j += 1
    }
  }
  return d[n]
}
