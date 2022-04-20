//
//  MiniSumOfFourDigit.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation

func minimumSum(_ num: Int) -> Int {
  let num = String(num)
  
  var digitArr = [Int]()
  var result = [[Int]]()
  
  for digit in num {
    digitArr.append(Int(String(digit))!)
  }
  
  let sortDigit = digitArr.sorted { $0 < $1 }
  
  for i in 0...1 {
    result.append([10 * sortDigit[i] + sortDigit[i + 2]])
  }
  
  return result[0][0] + result[1][0]
}
