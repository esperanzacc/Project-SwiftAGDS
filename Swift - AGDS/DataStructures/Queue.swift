//
//  Queue.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-29.
//

import Foundation

/// The Queue class represents a first-in-first-out (FIFO) queue of generic items.
/// It supports the usual *eunque* and *dequeue* operations, along with methods for peeking at the first item, testing if the queue is empty, and iterating through the items in FIFO order.
/// This implementation uses a singly linked list with an inner class for linked list nodes.

public final class Queue<E>: Sequence {
  // beginning of Queue
  private var first: Node<E>? = nil
  // last of Queue
  private var last: Node<E>? = nil
  
  // number of items in Queue
  private(set) var count: Int = 0
 
  // helper linked list node class
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  // initializes an empty Queue
  public init() {}
  
  public func peek() -> E? {
    return first?.item
  }
  
  // add an item
  public func enqueue(item: E) {
    let oldLast = last
    last = Node(item: item, next: nil)
    if isEmpty() { first = last }
    else { oldLast?.next = last }
    count += 1
  }
  
  public func dequeue() -> E? {
    if let item = first?.item {
      first = first?.next
      count -= 1
      
      if isEmpty() { last = nil }
      return item
    }
    return nil
  }
      
  public func isEmpty() -> Bool {
    return count == 0
  }
  
  // returns an iterator
  public struct QueueIterator<E>: IteratorProtocol {
    private var current: Node<E>?
    
    fileprivate init(_ first: Node<E>?) {
      self.current = first
    }
    public mutating func next() -> E? {
      // if there is an item
      if let item = current?.item {
        current = current?.next
        return item
      }
      return nil
    }
  }
  
  public func makeIterator() -> QueueIterator<E> {
    return QueueIterator<E>(first)
  }
}

extension Queue: CustomStringConvertible {
  public var description: String {
    self.reduce(into: "") { $0 += "\($1) " }
  }
}

