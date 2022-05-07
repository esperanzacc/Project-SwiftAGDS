//
//  124BinaryTreeMaxPathSum.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation

func maxPathSum(_ root: TreeNode?) -> Int {
  // create max variable and compare
  // Tree Traversal: Post-Order -> count the sum
  
  var maxSum = Int.min // not create 0 cuz what if answer is 0 which will not greater than 0, the result will be wrong
  func postOrder(_ node: TreeNode?) -> Int {
  guard let node = node else {
    return 0
  }
  let left = max(0, postOrder(node.left))
  let right = max(0, postOrder(node.right))
  
  maxSum = max(maxSum, left + right + node.val)
  return max(left, right) + node.val
  }

postOrder(root)
return maxSum
  
  
}
