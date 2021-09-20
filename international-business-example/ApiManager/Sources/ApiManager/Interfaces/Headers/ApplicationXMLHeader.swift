//
//  File.swift
//  
//
//  Created by Jorge Poveda on 18/9/21.
//

import Foundation

public struct ApplicationXMLHeader: HTTPHeaderProtocol {
    private let customHeaders: [RequestHeaderType: String]
    public var standardHeaders: [RequestHeaderType: String] {
        [.Accept: "application/xml"]
    }

    public var headers: [RequestHeaderType: String] {
        customHeaders.merging(standardHeaders) { current, _ -> String in
            current
        }
    }

    public init(customHeaders: [RequestHeaderType: String] = [:]) {
        self.customHeaders = customHeaders
    }
}
