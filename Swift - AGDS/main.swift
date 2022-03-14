//
//  main.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-02.
//

import Foundation

//print(factorial(n: 5))
//
//print(isPalindrome("madam"))
//print(isPalindrome("esperanza"))
//
//printBinary(52)
//print()
//printBinary(42)
//print()
//
//reverseLines(0)
//printBinaryExhaustive(4)
//printDecimal(3)
//print(evaluate("((3+4)+((2*9)*5))"))
//permutation("park")
//permutationUnique("hellp")

//combinations("google", 2)
//rollDice(6)
//rollDiceSumNaive(2, 5)
//print(times)
//rollDiceSum(2, 5)
//print(count)
//rollDiceCombination(2, 4)

//var arr = ["A", "B"]
//if let i = linearSearch(arr, "B") {
//  print(i)
//} else {
//  print("Target does not exist.")
//}

var numbers = [5, 1, 2, 3, 3, 7, 9]
//print(bubbleSort(numbers, <))
//print(selectionSort(numbers, <))
//print(insertionSort(numbers, <))
quickSort(&numbers, 0, 6)
print(numbers)
