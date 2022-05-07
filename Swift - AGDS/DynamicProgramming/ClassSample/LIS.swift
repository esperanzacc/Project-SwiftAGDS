//
//  LIS.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
  // nums = [10,9,2,5,3,7,101,18]
  // 1. define the subproblem
  // d[N] = the length of the LIS where the last element is nums[N]
  // d[0] = 1
  // d[1] = 1
  // d[2] = 1
  // d[3] = 2
  // d[4] = 2
  // d[5] = 3
  // d[6] = 4
  // d[7] = 4
  
  // 2. recurrence relation
  // d[i] = max(1, d[j] + 1) where 0 <= j <= i - 1 && nums[i] > nums[j]
  // (d[i] = 1 if there's no element less than nums[i] for all 0 <= j <= i-1)
  let n = nums.count
  var d = [Int](repeating: 1, count: n + 1)
  for i in 1...n {
    var longest = 1
    for j in 0...i-1 {
      if nums[j] < nums[i] {
        longest = max(longest, d[j] + 1)
    }
  }
  d[i] = longest
}
return d.max()!
}


func lengthOfLIS2(_ nums: [Int]) -> Int {
  if nums.count == 0 { return 0 }
  var d = [Int](repeating: 0, count: nums.count)
  
  for i in 0..<nums.count {
    d[i] = 1
    for j in 0..<i {
      print(d)
      print(i, j)
      if nums[j] < nums[i] && d[i] < d[j] + 1 {
        d[i] = d[j] + 1
      }
    }
  }
  
  return d.max()!
}
