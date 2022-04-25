//
//  SpiltStringInBalanced.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation

func balancedStringSplit(_ s: String) -> Int {
  var result = [String]()
  var string = ""
  
  for subString in s {
    string += String(subString)
    if string.filter({ $0 == "L"}).count == string.filter({ $0 == "R"}).count {
      result.append(string)
    }
  }
  return result.count
}
