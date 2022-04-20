//
//  Max69Num.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation

func maximum69Number (_ num: Int) -> Int {
  
  let num = String(num)
  var result = [String]()
  
  for i in num {
    result.append(String(i))
  }
  
  for i in 0..<result.count {
    if result[i] != "9" {
//      print(result)
      result[i] = "9"
//      print(result)
      break
    }
  }
  
  let output = Int(result.joined(separator: ""))!
//  print(output)
  
  return output
}
