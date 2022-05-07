//
//  TwoByNTiles2.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

func twoByNTiles2(_ n: Int) -> Int {
  if n <= 1 { return n }
  
  var d = [Int](repeating: 0, count: n + 1)
  d[1] = 1
  d[2] = 3
  for i in 3...n {
    d[i] = d[i - 1] + d[i - 2] * 2
  }
  return d[n]
}
