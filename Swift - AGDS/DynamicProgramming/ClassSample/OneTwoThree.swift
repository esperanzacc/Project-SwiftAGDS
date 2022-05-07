//
//  OneTwoThree.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

func oneTwoThree() {
  var d = [Int](repeating: 0, count: 12)
  d[1] = 1
  d[2] = 2
  d[3] = 4
  
  for i in 4...11 {
    d[i] = d[i - 1] + d[i - 2] + d[i - 3]
  }
  
  var t = Int(readLine()!)!
  while t > 0 {
    let n = Int(readLine()!)!
    print(d[n])
    t -= 1
  }
}
