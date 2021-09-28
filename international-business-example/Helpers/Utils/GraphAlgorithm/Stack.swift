//
//  Stack.swift
//  international-business-example
//
//  Created by Jorge Poveda on 23/9/21.
//

import Foundation

public struct Stack<T> {
    var array: [T] = []
    
    public init() {}
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
        let stackElements = array.map { "\($0)" }.joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
