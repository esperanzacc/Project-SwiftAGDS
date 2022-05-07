//
//  JumpGame.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-03.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
         var dp = [Bool](repeating: false, count: nums.count + 1)
        if nums[0] + 1 == nums.count {
            return true
        }
        
        // append true or false in dp
        var index = 0
            for var i in 0..<nums.count - 1 { // check the value of array -> 2
                  index += i
                    // 0 + 1 = 1   0 + 2 = 2
                for j in (i + 1)...(i + nums[i]) { // check each step -> step 1, step 2
                    index += j // ->  2
                  print("index: \(index)")
                  print("j: \(j)")
                    if index + j == nums.count - 1 {
                    dp[index + 1] = true
                      return dp[index + 1]
                    }
                  i = nums[j]
                  index = 0
                  print("i: \(i)")
                  print(dp)
                }
                  
            }
  return false
    }
