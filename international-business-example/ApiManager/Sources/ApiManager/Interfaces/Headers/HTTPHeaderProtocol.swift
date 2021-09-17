//
//  HTTPHeaderProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public protocol HTTPHeaderProtocol {
    var headers: [RequestHeaderType: String] { get }
    var standardHeaders: [RequestHeaderType: String] { get }
}

public enum RequestHeaderType: String {
    case Accept
}
