//
//  Searching.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-10.
//

import Foundation

// Linear Search Algorithm - O(N)
// Generic Function
// Check one by one

func linearSearchBasic<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for i in 0..<collection.count {
    if collection[i] == target {
      return i
    }
  }
  return nil
}

// Way of enumeration
// Returns the index of the given target value from the collection, Otherwise, nil.
// Description:
// - Parameters:
// - collection: an array of equatable objects
// - target: search target value
// - Returns: the index of the given target value from the collection

func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
  for (index, element) in collection.enumerated() where element == target {
    return index
  }
  return nil
}

// Binary Search Algorithm (for sorted collections) - O(lg N)
// Description:
// - Parameters:
// - collection: an array of equatable objects
// - target: search target value
// - Returns: the index of the given target value from the collection
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
  var lower = 0 //index
  var upper = collection.count - 1 //index
  
  while lower <= upper {
    let mid = (lower + upper) / 2
    if collection[mid] == target {
      return mid
    } else if collection[mid] < target {
      lower = mid + 1
    } else {
      upper = mid - 1
    }
  }
  
  return nil
}
