//
//  prettyNumber.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

// N : the number of digits
// L : the last digit
// d[N][L] = d[N-1][L-1] + d[N-1][L+1] where 1 <= L <= 8
// d[N][L] = d[N-1][L+1] where L = 0
// d[N][L] = d[N-1][L-1] where L = 9
func prettyNumber(_ n: Int) -> Int {
  var d = [[Int]] (repeating: [Int](repeating: 0, count: 10), count: n + 1)
  for i in 1...9 {
    d[1][i] = 1
  }
  
  for i in 2...n { // N
    for j in 0...9 { //L
      d[i][j] = 0
      if j >= 1 {
        d[i][j] += d[i-1][j-1]
      }
      if j <= 8 {
        d[i][j] += d[i-1][j+1]
      }
    }
  }
  var ans = 0
  for i in 0...9 {
    ans += d[n][i]
  }
  
  return ans
}
