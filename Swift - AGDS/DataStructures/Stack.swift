//
//  Stack.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-29.
//

import Foundation

/// The Stack class represents a last-in-first-out (LIFO) stack of generic items.
/// It supports the usual *push* and *pop* operations, along with methods for peeking at the top item, testing if the stack is empty, and iterating through the items in LIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.

public final class Stack<E>: Sequence {
  // top of stack
  private var first: Node<E>? = nil
  
  // number of items in stack
  private(set) var count: Int = 0
  
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  // initializes an empty stack
  init() {}
  
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  // add an item in stack
  // add new elements to the front -> O(1)
  public func push(item: E) {
    let oldFirst = first
    first = Node(item: item, next: oldFirst)
    count += 1
  }
  
  // removes and returns the item most recently added to the stack
  public func pop() -> E? {
    // check if this item is the topmost one or not
    if let item = first?.item {
      // if it is the topmost, pop out, the first one will be the next node
      first = first?.next
      count -= 1
      
      return item
    }
    return nil
  }
  
  // returns(but does not remove) the item most recently added to the stack
  public func peek() -> E? {
    if let item = first?.item {
      return item
    }
    return nil
  }
  
  public struct StackIterator<E>: IteratorProtocol {
    private var current: Node<E>?
    
    fileprivate init(_ first: Node<E>?) {
      self.current = first
    }
    public mutating func next() -> E? {
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
  }
  
  // returns an iterator
  public func makeIterator() -> StackIterator<E> {
    return StackIterator<E>(first)
  }
}

extension Stack: CustomStringConvertible {
  public var description: String {
    self.reduce(into: "") { $0 += "\($1), " }
  }
}
