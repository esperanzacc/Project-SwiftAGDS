//
//  MaximumProductSubarray.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-28.
//

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    var value = nums[0]
    var curMin = value
    var curMax = value
    
    for i in 1..<nums.count {
        let num = nums[i]
        let vals = [curMax * num, curMin * num, num]
        if let max = vals.max() { curMax = max }
        if let min = vals.min() { curMin = min }
        value = max(value, curMax)
    }
  
    return value
  
}
