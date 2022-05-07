//
//  ClimbingStairs.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-28.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
   if n == 1 { return 1 }
   if n == 2 { return 2 }
   
   var dp = [Int](repeating: 0, count: n+1)
   dp[1] = 1
   dp[2] = 2
   
   for i in 3...n {
       dp[i] = dp[i-1] + dp[i-2]
   }
   return dp[n]
}
