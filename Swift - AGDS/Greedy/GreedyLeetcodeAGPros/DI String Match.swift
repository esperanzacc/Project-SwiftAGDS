//
//  DI String Match.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation

func diStringMatch(_ s: String) -> [Int] {
  
  let string = Array(s)
  print(string)
  
  var perm = [Int]()
  var result = [Int]()
  
  for i in 0...string.count {
    perm.append(i)
  }
  print(perm)
  
  for i in 0..<string.count {
    if string[i] == "I" {
      result.append(perm[0])
      print(result)
      perm.removeFirst()
    } else {
      result.append((perm.last)!)
      perm.removeLast()
      print(result)
      
    }
    if perm.count == 0 {
      break
    } else if perm.count == 1 {
      result.append((perm.first!))
      break
    }
  }
  
  print(result)
  return result
        
}
