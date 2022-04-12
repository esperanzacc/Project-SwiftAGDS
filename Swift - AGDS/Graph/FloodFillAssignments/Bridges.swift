//
//  Bridges.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-09.
//

import Foundation

func buildShortestWay() {
  
  struct Square {
    let x: Int
    let y: Int
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  // Input
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  
  let N = firstLine[0]
  
  var grid = [[Int]]()
  var islandMap = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
  
  var distanceMap = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
  print(distanceMap)
  
  func bfs(x: Int, y: Int, id: Int, n: Int) {
    let q = Queue<Square>()
    q.enqueue(item: Square(x: x, y: y))
    islandMap[x][y] = id
    
    while !q.isEmpty() {
      let sq = q.dequeue()!
      let x = sq.x
      let y = sq.y
      for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        // check the bounds
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
          if grid [nx][ny] == 1 && islandMap[nx][ny] == 0 {
            q.enqueue(item: Square(x: nx, y: ny))
            islandMap[nx][ny] = id
          }
        }
      }
    }
  }
  
  for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map({ Int($0)! })
    grid.append(row)
  }
  
  print("----------------The first Queue---------------------")
  
  // mark islands as different ID
  var id = 1
  var idArray = [Int]()
  for x in 0..<N {
    for y in 0..<N {
      if grid[x][y] == 1 && islandMap[x][y] == 0 {
        idArray.append(id)
        bfs(x: x, y: y, id: id, n: N)
        id += 1
      }
    }
  }
  
  // Check intial state
  
  var first = Square(x: 0, y: 0)
  let q = Queue<Square>()
  
  // get the num of how many islands exist
  let initialIslandsNum = idArray.count
  
  // get the Square(x,y) point of each island
  for k in 1...initialIslandsNum {
    for i in 0..<N {
      for j in 0..<N {
        if islandMap[i][j] == k {
          distanceMap[i][j] = 0
          first = Square(x: j + 1, y: i + 1)
          q.enqueue(item: first)
        }
      }
    }
  }
  
  for row in islandMap {
    print(row)
  }
  
  print("----Do BFS-----")
  
  // BFS & Dequeue
  var clashed = false
  
  while !q.isEmpty() && !clashed {
    let start = q.dequeue()!
//    print("start: \(start)")
    for i in 0..<4 {
      let nx = start.x + dx[i]
      let ny = start.y + dy[i]
      
      if nx > 0 && nx <= N && ny > 0 && ny <= N {
        if islandMap[ny - 1][nx - 1] == 0 {
          q.enqueue(item: Square(x: nx, y: ny))
          distanceMap[ny - 1][nx - 1] = distanceMap[start.y - 1][start.x - 1] + 1
          islandMap[ny - 1][nx - 1] = islandMap[start.y - 1][start.x - 1]
        } else if islandMap[ny - 1][nx - 1] != 0 && islandMap[ny - 1][nx - 1] != islandMap[start.y - 1][start.x - 1] {
          print("clash here!")
          clashed = true
          print("from: \(distanceMap[start.y - 1][start.x - 1])")
          print("to : \(distanceMap[ny - 1][nx - 1])")
          print("sum: \(distanceMap[start.y - 1][start.x - 1] + distanceMap[ny - 1][nx - 1])")
          break
        }
          
      }
        
    }
  }
    
    print("------------------Island Map---------------------")
    for row in islandMap {
         print(row)
    }
    
    print("------------------Distance Map---------------------")
    for row in distanceMap {
      print(row)
    }
}
         
  
  // Sample Input
  
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 1
//0 0 0 0 0 0 0 0 0 0
//0 0 0 0 1 1 0 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0

  
//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 1 0 0 1
//0 0 0 0 0 0 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0

//10
//1 1 1 0 0 0 0 1 1 1
//1 1 1 1 0 0 0 0 1 1
//1 0 1 1 0 0 0 0 1 1
//0 0 1 1 1 0 0 0 0 1
//0 0 0 1 0 0 0 0 0 1
//0 0 0 0 0 0 1 1 0 1
//1 1 0 0 0 0 1 0 0 0
//1 1 0 0 1 1 1 0 0 0
//1 0 0 0 1 1 1 0 0 0
//0 0 0 0 0 0 0 0 0 0
