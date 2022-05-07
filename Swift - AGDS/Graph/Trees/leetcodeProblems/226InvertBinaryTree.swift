//
//  226InvertBinaryTree.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation
func invertTree(_ root: TreeNode?) -> TreeNode? {
  if root == nil { return nil }
  let tmp = root?.right
  
  root?.right = root?.left
  root?.left = tmp
  
  return root
}
