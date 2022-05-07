//
//  SumOfSquare.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-04.
//

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
  let sqrtC = Int(Double(c).squareRoot())
  
  for a in 0...sqrtC {
    for b in 0...sqrtC {
      if a * a + b * b == c {
        return true
      }
    }
  }
  return false
        
}

func judgeSquareSumOptimized(_ c: Int) -> Bool {
  let sqrtC = Int(Double(c).squareRoot()) + 1
  print(sqrtC)
  var a = 0
  var b = sqrtC
  while a <= b {
    print(a, b)
    if a * a + b * b < c {
      a += 1
    } else if a * a + b * b > c {
      b -= 1
    } else {
      return true
    }
  }
  return false
}
