//
//  MaxSubarray.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

// d[n] = the largest sum where nums[n] is the last element
// d[n] = max(d[n-1] + nums[n], nums[n])
func maxSubArray(_ nums: [Int]) -> Int {
  let n = nums.count
  var d = [Int](repeating: 0, count: n)
  d[0] = nums[0]
  
  for i in 1..<n {
    d[i] = nums[i]
    if d[i] < d[i - 1] + nums[i] {
      d[i] = d[i - 1] + nums[i]
    }
  }
  
  return d.max()!
}
