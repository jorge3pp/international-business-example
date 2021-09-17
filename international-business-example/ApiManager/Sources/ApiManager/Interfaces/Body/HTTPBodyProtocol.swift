//
//  HTTPBodyProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public protocol HTTPBodyProtocol {
    func create(paramsDictionary: [String: Any]) -> Data
}
