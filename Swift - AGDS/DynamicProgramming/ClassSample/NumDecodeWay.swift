//
//  NumDecodeWay.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

// dp[n] = the number of ways to decode n digits
func numDecodings(_ s: String) -> Int {
  let arr: [String.Element] = Array(s)
  var dp = [Int](repeating: 0, count: s.count + 1)
  dp[0] = 1 // doing nothing
  dp[1] = s.first! == "0" ? 0 : 1
  if s.count >= 2 {
    for i in 2...s.count {
      let firstDigit = Int(String(arr[i - 1]))!
      if firstDigit >= 1 {
        dp[i] += dp[i - 1]
      }
      let twoDigits = firstDigit + Int(String(arr[i - 2]))! * 10
      if twoDigits >= 10 && twoDigits <= 26 {
        dp[i] += dp[i - 2]
      }
    }
  }
  
  return dp[s.count]
}

