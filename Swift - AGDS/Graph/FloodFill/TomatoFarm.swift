//
//  TomatoFarm.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-04-08.
//

import Foundation

func findMiniDays() {
  struct Box {
    let x: Int
    let y: Int
  }
  
  let dx = [0, 0, 1, -1]
  let dy = [1, -1, 0, 0]
  
  // Input 6 4
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
//  print(firstLine)
  let width = firstLine[0]
//  print(width)
  let height = firstLine[1]
//  print(height)
 
  var check = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
  
  var grid = [[Int]]()
  
  var first = Box(x: 0, y: 0)
  let q = Queue<Box>()
  
  // grid - grid-shaped boxes
  
  // find ripe tomatoes in grid
  for i in 0..<height {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
//    print(grid[0][0])
    
    for j in 0..<width {
      if grid[i][j] == 1 {
        first = Box(x: j + 1, y: i + 1)
        q.enqueue(item: first)
        check[i][j] = true
      }
    }
  }
  
  // BFS
  var miniDays = 0
  var answer = [Int]()
  
  while !q.isEmpty() {
    // start from ripe tomato
    let start = q.dequeue()!
//    print("next: \(start)")
    
    // check left right up down
    for i in 0..<4 {
      let nx = start.x + dx[i]
//      print("nx: \(nx)")
      let ny = start.y + dy[i]
//      print("ny: \(ny)")
      
      if nx > 0 && nx <= width && ny > 0 && ny <= height {
        if !check[ny - 1][nx - 1] && grid[ny - 1][nx - 1] == 0 {
          q.enqueue(item: Box(x: nx, y: ny))
//          print("q: \(q)")
//          print(start.y)
//          print(start.x)
          grid[ny - 1][nx - 1] = grid[start.y - 1][start.x - 1] + miniDays
          check[ny - 1][nx - 1] = true
        }
      }
//      print(check)
//      print(grid)
      
    }
    miniDays = 1
  }
  
  for i in 0..<height {
    for j in 0..<width {
      answer.append(grid[i][j])
    }
  }
  if answer.max() == 1 {
    print("Done: 0")
  }  else if answer.contains(0) {
    print("Uncomplete: -1")
  } else {
    print(answer.max()!)
  }
  
}

//6 4
//1 -1 0 0 0 0
//0 -1 0 0 0 0
//0 0 0 0 -1 0
//0 0 0 0 -1 1

//6 4
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

//6 4
//0 -1 0 0 0 0
//-1 0 0 0 0 0
//0 0 0 0 0 0
//0 0 0 0 0 1

//5 5
//-1 1 0 0 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 -1 -1 -1 0
//0 0 0 0 0

//2 2
//1 -1
//-1 1
