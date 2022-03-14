//
//  BackTracking.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-07.
//

import Foundation

// Exhaustive search(review)
func rollDice(_ n: Int) {
  var choices = [Int]()
  rollDiceHelper(n, choices: &choices)
  
}

func rollDiceHelper(_ n: Int, choices: inout [Int]) {
  // base case ( n is number of roll dice)
  if n == 0 {
    print(choices)
  } else {
    // for all possible choices
    for i in 1...6 {
      // choose one
      choices.append(i)
      // explore
      rollDiceHelper(n - 1, choices: &choices)
      // un-choose the last choice
      choices.removeLast()
    }
  }
  
}

// Backtracking Problem
func rollDiceSumNaive(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelperNavie(n, sum, choices: &choices)
  
}

//func rollDiceSumHelper(_ n: Int, _ sum: Int, choices: inout [Int]) {
//  if n == 0 {
//    var s = 0
//    for i in choices {
//      s += i
//    }
//    if s == sum {
//      print(choices)
//    }
//  } else {
//    for i in 1...6 {
//      choices.append(i)
//      rollDiceSumHelper(n - 1, sum, choices: &choices)
//      choices.removeLast()
//    }
//  }
//}
var times = 0
func rollDiceSumHelperNavie(_ n: Int, _ sum: Int, choices: inout [Int]) {
  times += 1
//  print("n times: \(n) sum equal to \(sum) , choices\(choices)")
  if n == 0 {
    if sum == 0  {
      print(choices)
    }
  } else {
    for i in 1...6 {
      choices.append(i)
      rollDiceSumHelperNavie(n - 1, sum - i, choices: &choices )
      choices.removeLast()
    }
  }
}

// Optimizations

func rollDiceSum(_ n: Int, _ sum: Int) {
  var choices = [Int]()
  rollDiceSumHelper(n, sum, 0, &choices)
  
}

var count = 0
func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, _ soFarSum: Int, _ choices: inout [Int]) {
  count += 1
//  print("n times: \(n) sum equal to \(sum) , choices\(choices)")
  if n == 0 {
    if soFarSum == desiredSum {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if (soFarSum + i + 1 * (n - 1) <= desiredSum && (soFarSum + i + 6 * (n - 1) >= desiredSum)) {
        choices.append(i)
        rollDiceSumHelper(n - 1, desiredSum, soFarSum + i, &choices )
        choices.removeLast()
      }
    }
  }
}

// Combinations
func rollDiceCombination(_ n: Int, _ sum: Int) {
  var choices = Set<Int>()
  rollDiceCombinationHelper(n, sum, 0, &choices)
  print(choices)
  
}

var countTimes = 0
func rollDiceCombinationHelper(_ n: Int, _ desiredSum: Int, _ soFarSum: Int, _ choices: inout Set<Int>) {
  countTimes += 1
//  print("n times: \(n) sum equal to \(sum) , choices\(choices)")
  if n == 0 {
    if soFarSum == desiredSum {
      print(choices)
    }
  } else {
    for i in 1...6 {
      if (soFarSum + i + 1 * (n - 1) <= desiredSum && (soFarSum + i + 6 * (n - 1) >= desiredSum)) {
        choices.insert(i)
        rollDiceCombinationHelper(n - 1, desiredSum, soFarSum + i, &choices )
        choices.remove(choices[choices.index(choices.startIndex, offsetBy: 2)])
        print(choices.startIndex)
    }
  }
}

}
