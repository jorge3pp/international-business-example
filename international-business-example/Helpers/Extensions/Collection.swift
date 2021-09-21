//
//  Collection.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
