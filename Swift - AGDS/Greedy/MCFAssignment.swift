//
//  MCFAssignment.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-23.
//

import Foundation
// 1. get input information
// 2. find the MST(kruskal's AG) and see how many active pipes are inclued in the MST!
// 3. if there are some inactive pipes not in the MST, which means might swap those
// 4. the number of inactive pipes == the number of days you need

func minCostFlow() -> Int {
  // Input [4, 4, 0] -> 4 bulildings, next 4 lines contain three integers Ai, Bi, and Ci, 0 enhancer
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//  print(firstLine)
  
//  let currentUsedNum = firstLine[1]
  
  var pipes = [(building1: Int, building2: Int, cost: Int)]()
  var currentPipes = [(building1: Int, building2: Int, cost: Int)]()
  var mstPipes =  [(building1: Int, building2: Int, cost: Int)]()
  var costPipes = [(building1: Int, building2: Int, cost: Int)]()
  
  for _ in 0..<firstLine[1] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    pipes.append((line[0], line[1], line[2]))
  }
  
  for i in 0..<firstLine[0]-1 {
    currentPipes.append(pipes[i])
  }

  pipes.sort { $0.cost < $1.cost }
  currentPipes.sort { $0.cost < $1.cost }
  print(pipes)

  var uf = UF(firstLine[0] + 1)
  print(uf)
  for pipe in pipes {   // O(E)
    if uf.connected(pipe.building1, pipe.building2) { continue }
    mstPipes.append(pipe)
    uf.union(pipe.building1, pipe.building2)
  }

  var days = 0
  print("currentPipes: \(currentPipes)")
  print("mstPipes: \(mstPipes)")

  for pipe in currentPipes {
    let has_pipe = mstPipes.contains(where: { $0 == pipe })
    if has_pipe {
      costPipes.append(pipe)
      days += 0
    } else {
      days += 1
    }
  }
  print(costPipes)
  
  var enhacePipe = costPipes.last!
  enhacePipe.cost = max(0, enhacePipe.cost - firstLine[2])
  print(enhacePipe)
  
  for var pipe in mstPipes {
    if pipe.building1 == enhacePipe.building1 && pipe.building2 == enhacePipe.building2 {
      pipe = enhacePipe
      mstPipes.removeLast()
      mstPipes.append(enhacePipe)
    }
    print(mstPipes)
  }

  let cost = mstPipes.map { $0.cost }.reduce(0, +)
  print(cost)
  
  return days == 0 ? 0 : days
}
 
//4 4 0
//1 2 1
//2 3 2
//3 4 1
//4 1 1
//4 4 0

//4 4 0
//1 2 715827882
//2 3 715827882
//3 4 715827882
//4 1 715827884


//5 6 2
//1 2 5
//2 3 5
//1 4 5
//4 5 5
//1 3 1
//1 5 1

//8 7 0
//4 8 336470888
//4 3 481199252
//8 6 167959139
//4 5 481199252
//3 7 634074578
//2 4 336470888
//7 1 167959139
