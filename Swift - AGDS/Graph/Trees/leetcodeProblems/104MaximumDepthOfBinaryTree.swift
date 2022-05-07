//
//  104MaximumDepthOfBinaryTree.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-05.
//

import Foundation
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init() { self.val = 0; self.left = nil; self.right = nil; }
     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
}

func maxDepth(_ root: TreeNode?) -> Int {
    // DFS left subtree
    // DFS right subtree
    // compare which is bigger
  guard let root = root else {
    return 0
  }

  let left = maxDepth(root.left)
  let right = maxDepth(root.right)
  
    return max(left, right) + 1
}


