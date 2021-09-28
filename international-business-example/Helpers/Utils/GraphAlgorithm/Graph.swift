//
//  Graph.swift
//  international-business-example
//
//  Created by Jorge Poveda on 23/9/21.
//

import Foundation

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Decimal?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Decimal?
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        
        return vertex
    }
    
    public func add(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Decimal?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    
    public func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Decimal? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        
        return nil
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.weight?.rounded()) \(edge.destination), ")
                } else {
                    edgeString.append("\(edge.weight?.rounded()) \(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
    
    private func depthFirstSearch(from start: Vertex<T>, to end: Vertex<T>) -> Stack<Vertex<T>> {
        var visited = Set<Vertex<T>>()
        var stack = Stack<Vertex<T>>()
        
        stack.push(start)
        visited.insert(start)
        
        outer: while let vertex = stack.peek(), vertex != end {
            guard let neighbours = self.adjacencyDict[vertex], neighbours.count > 0 else {
                print("backtrack from \(vertex)")
                stack.pop()
                continue
            }
            
            for edge in neighbours {
                if !visited.contains(edge.destination) {
                    visited.insert(edge.destination)
                    stack.push(edge.destination)
                    continue outer
                }
            }
            
            print("backtrack from \(vertex)")
            stack.pop()
            
        }
        return stack
    }
    
    public func completeGraph() {
        for (vertex, edges) in adjacencyDict {
            adjacencyDict.map({ $0.key }).forEach {
                if (!edges.map{ $0.destination.description }.contains($0.description) && $0.description != vertex.description){
                    let path = depthFirstSearch(from: vertex, to: $0)
                    var weight: Decimal = Decimal.one
                    for (index, _) in path.array.enumerated(){
                        weight *= transformPath(currentIndex: index, path: path.array)
                    }
                    add(from: vertex, to: $0, weight: weight)
                }
            }
        }
    }
    
    private func transformPath(currentIndex: Int, path: [Vertex<T>]) -> Decimal {
        guard let nextVertex = path[safe: currentIndex+1] else { return .one }
        return weight(from: path[currentIndex], to: nextVertex) ?? .one
    }
}
