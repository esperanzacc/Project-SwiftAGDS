//
//  duplicate.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation

func duplicate() -> Int {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  print(input)
  
  // binary search
  var lower = 1 // index
  var upper = input.count - 1 // from the last one
  
  while lower < upper {
    var count = 0
    let mid = (lower + upper) / 2
//    print("mid: \(mid)")
    
    for int in input {
      if int <= mid {
        count += 1
      }
    }
//    print(count)
  
    if count <= mid {
      lower = mid + 1
//      print("lower: \(lower)")
    } else {
      upper = mid
    }
  }
  return lower
}
 
  

//1 5 2 4 3 4
//1 5 2 4 3 8 6 7 9 3
