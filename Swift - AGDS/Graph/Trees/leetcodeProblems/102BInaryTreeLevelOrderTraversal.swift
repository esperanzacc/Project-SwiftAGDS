//
//  102BInaryTreeLevelOrderTraversal.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation
func levelOrder(_ root: TreeNode?) -> [[Int]] {
  guard let root = root else {
    return []
  }
  var result = [[Int]]()
  result.append([root.val])
  
  var queue = [TreeNode?]()
  queue.append(root)
  
  while !queue.isEmpty {
    // append value to one array, and when it is done, append to result
    var level = [Int]()
    for _ in 0..<queue.count {
      if let node = queue.removeFirst() {
        if let leftNode = node.left {
          queue.append(leftNode)
          level.append(leftNode.val)
        }
        if let rightNode = node.right {
          queue.append(rightNode)
          level.append(rightNode.val)
        }
      }
    }
    
    if !level.isEmpty {
      result.append(level)
    }
  }
  
  return result
  
}
