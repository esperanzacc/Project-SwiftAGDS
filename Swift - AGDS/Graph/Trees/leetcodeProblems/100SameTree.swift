//
//  100SameTree.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-05-06.
//

import Foundation
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
  if p == nil && q == nil { return true }
  return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}
