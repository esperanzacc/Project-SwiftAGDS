//
//  happy.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation

func happy() -> String {
  let input = String(readLine()!)
  print(input)
  
  let happy = input.components(separatedBy:":-)")
  let happyNum = happy.count - 1
//  print(happyNum)
  
  let sad = input.components(separatedBy:":-(")
  let sadNum = sad.count - 1
//  print(sadNum)
  
  if happyNum == 0 && sadNum == 0 {
    return "none"
  } else if happyNum == sadNum {
    return "unsecure"
  } else if happyNum > sadNum {
    return "happy"
  } else {
    return "sad"
  }
  
}

//This:-(is str:-(:-(ange te:-)xt.
