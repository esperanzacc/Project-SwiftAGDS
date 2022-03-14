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
  var set = Set<Character>()
  var result = Set<String>()
  combinationsHelper(word, k, &set, "", &result)
  print(result)
}

func combinationsHelper(_ word: String, _ k: Int, _ unique: inout Set<Character>,
                        _ soFar: String, _ result: inout Set<String>, indent: String = "") {
  print("\(indent)permutation(word: \(word), soFar: \(soFar))")
  // base case
  if k == 0 {
    result.insert(soFar)
  } else {
    for i in word {
      if !unique.contains(i) {
        unique.insert(i)
//        print("Before: \(unique)")
        combinationsHelper(word, k - 1, &unique, soFar + String(i), &result, indent: indent + "  ")
        unique.remove(i)
        print("After: \(unique)")
      }
    }
  }
}



