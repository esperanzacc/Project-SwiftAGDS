//
//  Pokemon.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation
// 1. define the subproblem
// d[i][j] = the most number of candies you can collect at i, j
// 2. recurrence
// d[i][j] = max(d[i-1][j] + grid[i][j], d[i][j-1] + grid[i][j])
func pokemon() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]
  var grid = [[Int]]()
  var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
  
  for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
  }
  print(dp)
  print(grid)
  
  for i in 0..<n {
    for j in 0..<m {
      dp[i][j] = grid[i][j]
      print("dp: \(dp)")
      if i - 1 >= 0 {
        print("i-1: \(i-1)")
        dp[i][j] = max(dp[i-1][j] + grid[i][j], dp[i][j])
      }
      if j - 1 >= 0 {
        print("j-1: \(j-1)")
        dp[i][j] = max(dp[i][j-1] + grid[i][j], dp[i][j])
      }
    }
  }
  print(dp[n-1][m-1])
}
//3 3
//1 0 0
//0 1 0
//0 0 1
