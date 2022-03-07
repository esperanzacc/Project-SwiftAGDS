//
//  Recursion.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-02.
//

import Foundation

func factorial(n: Int) -> Int {
  if n == 0 || n == 1 {
    return 1
  }
  return n * factorial(n: n-1)
}

// 1. power(base, exponent); base^exponent
// assume exponent >= 0

func power(base: Int, exponent: Int) -> Int {
  // base case
  if exponent == 0 {
    return 1
  }
  // recursive case
  return power(base: base, exponent: exponent - 1) * base
}

// 2. isPalindrome(word): checks if a word is palindrome
func isPalindrome(_ word: String) -> Bool {
  // base case
  if word.count <= 1 {
    return true
  }
  
  // recursive case
  if word[0] == word[word.count - 1] {
    return isPalindrome(word[1, word.count - 1 ])
  }

  return false
}

// 3. printBinary(n): prints binary form of the given Int n
// print("Hello, terminator: "") // print without newline (ends with an empty string)
func printBinary(_ n: Int) { // 'feel free to change the arguments'
  // base case
  if (n < 0) {
    print("-", terminator: "")
    printBinary(-n)
  }
  if n <= 1 {
    print(n, terminator: "")
    return
  }
   
  //recursive case
  //  printBinary(52) = printBinary(26) + (52 % 2)
  printBinary(n / 2)
  print(n % 2, terminator: "")
    
}

// 4. reverseLines 
func reverseLines(_ line: Int = 0) {
  let contents = try! String(contentsOfFile: "/Users/esperanzachen/Desktop/Xode/Swift - AGDS/Swift - AGDS/Recursion/story.txt")
  let lines = contents.split(separator: "\n")

  if line < lines.count {
    reverseLines(line + 1)
    print(lines[line])
  }
}

// 5. evaluate
func evaluate(_ expr: String) -> Int {
  //check index order of string
  var i = 0 // want to change memory address, use inout parameter
  return evaluateHelper(expr, i: &i)  
}

func evaluateHelper(_ expr: String, i: inout Int ) -> Int {
  // base case
  if Character(expr[i]).isNumber {
    return Int(expr[i])!
  } else {
  // recursive case
  // (
    i += 1 // skip (
  // num/expr
    let left = evaluateHelper(expr, i: &i)
    i += 1
  // operator + or *
    let op = expr[i]
    i += 1
  // num/expr
    let right = evaluateHelper(expr, i: &i)
  // )
    i += 1 // skip )
    
    if op == "+" {
      return left + right
    } else {
      return left * right
    }
  
  }
  
}
