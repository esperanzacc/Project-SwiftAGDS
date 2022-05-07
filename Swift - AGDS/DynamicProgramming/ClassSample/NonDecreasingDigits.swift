//
//  NonDecreasingDigits.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation
// 1. d[N][L] = the total number of non-decreasing digits with N digits ends with L
// 2. how it ends? (N-1, N)
// 3. d[N][L] = sum(d[L][k]) where 0 <= k <= L
func nonDecreasingDigits(_ n: Int) -> Int {
  var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n + 1)
  for i in 0...9 {
    d[1][i] = 1
  }
  for i in 2...n {
    for j in 0...9 {
      for k in 0...j {
        d[i][j] += d[i - 1][k]
      }
    }
  }
  var ans = 0
  for i in 0...9 {
    ans += d[n][i]
  }
  return ans 
}
