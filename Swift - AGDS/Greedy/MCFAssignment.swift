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

func minCostFlow() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let (N, M, D) = (firstLine[0], firstLine[1], firstLine[2])
  
  var pipes = [Edge](unsafeUninitializedCapacity: M ) { (buffer, count) in
    for i in 0..<M {
      let line = readLine()!.split(separator: " ").map { Int($0)! }
      if i < N - 1 {
        buffer[i] = Edge(line[0], line[1], line[2], 1)
      } else {
        buffer[i] = Edge(line[0], line[1], line[2], 0)
      }
    }
    count = M
  }
  
  pipes.sort { $0.cost < $1.cost }

  var uf = UF(N + 1)
  var (days, count, max, i) = (0, 0, 0, 0)
  
  // get MST -> optimized plan
  while i < M {
    if count == N - 1 { break }
    let pipe = pipes[i]
    if uf.union(pipe.u, pipe.v) {
      count += 1
      max = pipe.cost
      if pipe.active == 0 { days += 1}
    }
    i += 1
  }
  
  // either days or days - 1 is the answer.
  // check if we can use enhancer to reduce one day.
  // want to replace the inactive pipe (heaviest) with an active pipe with same or less MST cost.
  if pipes[i - 1].active == 0 {
    var uf2 = UF(N + 1) // another Kruskal's algorithm since the replaced active pipe should form a MST.
    for e in pipes {
      if !uf2.connected(e.u, e.v) {
        if e.cost < max || (e.cost == max && e.active == 1) {
          // all pipes that were part of the optimized plan should be included.
          uf2.union(e.u, e.v)
        } else if e.active == 1 && e.cost <= D {
          // active pipe that has the cost less than or equal to the enhancer.
          // because the MST cost has to be less than or equal to the previous optimized plan.
          // (otherwise, there's no reason to replace.)
          days -= 1
          break
        }
      }
    }
  }
  print(days)

}

public struct Edge: Comparable {
  private(set) var u: Int
  private(set) var v: Int
  private(set) var cost: Int
  private(set) var active: Int
  
  init(_ u: Int, _ v: Int, _ weight: Int, _ active: Int) {
    self.u = u
    self.v = v
    self.cost = weight
    self.active = active
  }
  
  public static func < (lhs: Edge, rhs: Edge) -> Bool {
    if lhs.cost != rhs.cost { return lhs.cost < rhs.cost }
    return lhs.active > rhs.active
  }
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
