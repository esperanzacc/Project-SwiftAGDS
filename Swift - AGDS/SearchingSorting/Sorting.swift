//
//  Sorting.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-09.
//

import Foundation

//func <(lhs: Int, rhs: Int) -> Bool {
//
//}

// Bubble Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  
  guard arr.count > 1 else { return arr }
  var arr = arr // default argument in function is constant
  for i in 0..<arr.count - 1 {
    for j in 1..<arr.count - i {
      if comparator(arr[j - 1], arr[j]) {
        let temp = arr[j - 1]
        arr[j - 1] = arr[j]
        arr[j] = temp
      }
    }
  }
  return arr
  
}
  
// Selection Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var arr = arr
  
  for i in 0..<arr.count - 1 {
    var minIndex = i
    for j in i+1..<arr.count {
      if comparator(arr[j], arr[minIndex]) {
        minIndex = j
      }
    }
    
    if i != minIndex {
      arr.swapAt(minIndex, i)
    }
  }
  
  return arr
}

// Insertion Sort
// Time Complexity: O(N^2)
// Space Complexity: O(N)

func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  guard arr.count > 1 else { return arr }
  var arr = arr
  
  for i in 1..<arr.count {
    var j = i // the index of element we have to insert
    print(j)
    let toInsert = arr[j]
    print(toInsert)
    while j > 0 && comparator(toInsert, arr[j - 1]) {
      // shift
      arr[j] = arr[j - 1]
      print(j)
      j -= 1
      print(j)
    }
    arr[j] = toInsert
    print(j)
    print(toInsert)
  }
  return arr
}

// Merge Sort
// Time Complexity: O(N lgN)
// Space Complexity: O(N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T, T) -> Bool) -> [T] {
  // base case
  guard arr.count > 1 else { return arr }
  // cut in half O(lg N)
  let mid = arr.count / 2
  let sortedLeft = mergeSort(Array(arr[0..<mid]), comparator)
  let sortedRight = mergeSort(Array(arr[mid...]), comparator)
  // merge sortedLeft + sortedRight O(N)
  
  return merge(sortedLeft, sortedRight, comparator)
}

// Time Complexity: O(N)
func merge<T: Comparable>(_ l: [T], _ r: [T], _ comparator: (T, T) -> Bool) -> [T] {
  var i = 0
  var j = 0
  var merged: [T] = []
  while true {
    guard i < l.count else {
      merged.append(contentsOf: r[j...])
      break
    }
    guard j < r.count else {
      merged.append(contentsOf: l[i...])
      break
    }
    if comparator(l[i], r[j]) {
      merged.append(l[i])
      i += 1
    } else {
      merged.append(r[j])
      j += 1
    }
  }
  return merged
  
}
    
// Quick Sort
//
//func quickSort(_ arr: inout [Int], _ left: Int, _ right: Int) {
//
//}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
  // TODO
  
  guard start >= 0 && end < arr.count && end - start > 0 else { return }
  print(#function)
  let pivotNumOfIndex = partition(&arr, start, end)
  // Next: spilt two part of array from the standard point
  // left array
  quickSort(&arr, start, pivotNumOfIndex - 1)
  // right array
  quickSort(&arr, pivotNumOfIndex + 1, end)

}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
  // TODO
  print(#function)
  var i = start
  var j = end
  let pivotNum = arr[start]
//
//   from right to start to find smaller than pivot num
//   from left to start to find bigger than pivot num
  while i != j {
    while arr[j] >= pivotNum && i < j { j -= 1 }
    while arr[i] <= pivotNum && i < j { i += 1 }
//  print("work")
//   when both find what they want, then change these two order
    if i < j {
      let temp = arr[j]
      arr[j] = arr[i]
      arr[i] = temp
    }
  }

//   After they meet each other, change standard to the point left and right meet
  arr[start] = arr[i]
  arr[i] = pivotNum
  
  return i
}


