//
//  PartitionLabels.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-19.
//

import Foundation

func partitionLabels(_ s: String) -> [Int] {
  if s.count == 0 {
    return []
  }
  
  var lastIndexChart = [Character: Int]()
  var result = [Int]()
  
  for (index, alphabet) in s.enumerated() {
    print(index, alphabet)
    lastIndexChart[alphabet] = index
    print(lastIndexChart)
  }
  
  var previous = -1
  var maxIndex = 0
  
  for (index, alphabet) in s.enumerated() {
    maxIndex = max(maxIndex, lastIndexChart[alphabet]!)
    if maxIndex == index {
      result.append(maxIndex - previous)
      previous = maxIndex
    }
  }
  
  print(result)
  return result
}
