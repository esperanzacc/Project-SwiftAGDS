//
//  TaskScheduler.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-20.
//

import Foundation
func leastInterval(_ tasks: [Character], _ n: Int) -> Int {

  var frequencyMap = [Character : Int]()
  
 // 1. count the frequency of each task
  for task in tasks {
    let frequency = frequencyMap[task, default: 0] + 1
    frequencyMap[task] = frequency
  }
  
  // 2. sort frequency from highest to smallest
  let sortFrequency = frequencyMap.sorted { $0.value > $1.value }
  print(sortFrequency)
  
  // 3. count maxIdle times and minus the other taks frequency
  let max_frequency = sortFrequency[0].value
  var idleTime = (max_frequency - 1) * n
  
  for i in 1..<sortFrequency.count {
    idleTime -= min(max_frequency - 1, sortFrequency[i].value)
  }
  
  if idleTime > 0 {
    print(tasks.count + idleTime)
  } else {
    print(tasks.count)
  }
  return idleTime > 0 ? tasks.count + idleTime : tasks.count
  
}
