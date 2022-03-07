//
//  ExhaustiveSearch.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-03.
//

import Foundation

// print all binary number representation with n digits
// - parameter n: the number digits

func printBinaryExhaustive(_ n: Int) {
  printBinaryExhaustiveHelper(n)
}

func printBinaryExhaustiveHelper(_ n: Int, soFar: String = "", indent: String = "") {
//  print("\(indent)printBinaryExhaustiveHelper(n: \(n), soFar: \(soFar))")
  // base case
  if n == 0 {
    print(soFar)
  } else {
    // recursive case
    // for each available choices (0 or 1)
    // choose one
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "0")
    printBinaryExhaustiveHelper(n - 1, soFar: soFar + "1")
  }
}

// print all decimal number representation with n digits
// - parameter n: the number digits
func printDecimal(_ n: Int, _ soFar: String = "") {
  // stop
  if n == 0 {
    print(soFar)
  } else {
    // recursive case
    // choose from 1 - 9
    // search
    for i in 0...9 {
      let c = "\(i)"
      printDecimal(n - 1, soFar + c)
  }
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "0")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "1")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "2")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "3")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "4")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "5")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "6")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "7")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "8")
  //    printDecimalExhaustiveHelper(n - 1, soFar: soFar + "9")
    }
  
}

// Write a recursive function permutation that accepts a string as a parameter
// and outputs all possible rearrangement of the letters in the string
// - Parameter word: the string
func permutation(_ word: String) {
  printPermutationHelper(word)
}

func printPermutationHelper(_ word: String, soFar: String = "", indent: String = "") {
  print("\(indent)permutation(word: \(word), soFar: \(soFar))")
  if word.count == 0 {
    print(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i] // choose one character
      printPermutationHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + c, indent: indent + "  ")
    }
  }          
  
}

func permutationUnique(_ word: String) {
  var set = Set<String>()
  printPermutationUniqueHelper(word, set: &set)
  print(set)
  
}

func printPermutationUniqueHelper(_ word: String, soFar: String = "", set: inout Set<String>) {
  if word.count == 0 {
    set.insert(soFar)
  } else {
    // for all available choices
    for i in 0..<word.count {
      let c = word[i] // choose one character
      printPermutationUniqueHelper(word[0, i] + word[i + 1, word.count], soFar: soFar + c, set:  &set)
    }
  }
  
}

func combinations(_ word: String, _ k: Int) {
  combinationsHelper(word, k)
  
}

func combinationsHelper(_ word: String, _ k: Int = 0, soFar: String = "", indent: String = "") {
  
  var set = Set<String>()
  
  for character in word {
    set.insert(String(character))
//    print("set: \(set)")
  }

  let a = set.shuffled().prefix(k)
//  print("a: \(a)")
  let b = "\(a.joined(separator: ""))"
//  print(b)
  
  
  if b.count == 0 {
    print("soFar: \(soFar)")
  } else {
      for i in 0..<b.count {
//      print(b)
//      print(b.count)
      let c = b[i]
      print(c)
//      print(b[0, i])
//      print(b[i + 1, b.count])
      combinationsHelper2(b[0, i] + b[i + 1, b.count], soFar: soFar + c)
      print(soFar + c)

      }
    func combinationsHelper2(_ word: String, _ k: Int = 0, soFar: String = "", indent: String = "") {
      combinationsHelper(b)
    }
  }
}


//func getPathCrawlHelper(_ path: String) {
let manager = FileManager.default
let currentPath = manager.currentDirectoryPath

func crawl(_ path: String) {
  // check this path is empty or not
  if let currentPath = currentPath else {
    
    
    

}



  let dir = try? manager.contentsOfDirectory(at: URL(fileURLWithPath: currentPath), includingPropertiesForKeys: [], options: .skipsHiddenFiles)

  
                                                                                    
//
//}



//  for _ in 1...k {
//    let randomCharacter = word.randomElement()!
//    set.insert(String(randomCharacter))
//    print(set)
//  }
//  // when stop
//  if set.count == 0 {
//    print(soFar)
//  }
//  // for all available choices
//  for i in 0..<set.count {
//    // choose one choice
//    let c = set[i]
//    combinationsHelper(set[0, i] + set[i + 1, set.count], k, soFar: soFar + c)
//  }



}
