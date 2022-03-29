//
//  Bag.swift
//  Swift - AGDS
//
//  Created by Esperanza on 2022-03-15.
//

import Foundation

/// The **Bag** class represents a bag of generic items.
/// It supports insertion and iterating over the items in arbitrary order.
/// This implementation uses a singly linked list with an inner class Node.
/// The *add*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*.

// make it iterable
public final class Bag<E> : Sequence {
  // begining of bag
  private var first: Node<E>? = nil
  private var last: Node<E>? = nil
  
  // number of elements in bag
  private(set) var count: Int = 0
  
  fileprivate class Node<E> {
    fileprivate var item: E
    fileprivate var next: Node<E>?
    fileprivate var prev: Node<E>?
    fileprivate init(item: E, next: Node<E>? = nil) {
      self.item = item
      self.next = next
    }
  }
  
  // intialize an empty bag
  init() {}
  
  // returns true if this bag is empty
  // -returns: true if this bag is empty, otherwise false.
  public func isEmpty() -> Bool {
    return first == nil
  }
  
  // Adds the item to this bag(front) O(1)
  // - Parameter item: the item to add to this bag.
  public func add(item: E) {
    let oldFirst = first
    first = Node(item: item, next: oldFirst)
    count += 1
  }
  
  public struct BagIterator<E> : IteratorProtocol {
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
  // Returns an iterator that iterates over the items in this bag in reverse order.
  public func makeIterator() -> BagIterator<E> {
    return BagIterator<E>(first)
  }
  
}

extension Bag: CustomStringConvertible {
  public var description: String {
    self.reduce(into: "") { $0 += "\($1), "}
  }
}
