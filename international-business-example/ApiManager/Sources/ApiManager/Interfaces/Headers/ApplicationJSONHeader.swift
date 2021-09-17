//
//  ApplicationJSONHeader.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public struct ApplicationJSONHeader: HTTPHeaderProtocol {
    private let customHeaders: [RequestHeaderType: String]
    public var standardHeaders: [RequestHeaderType: String] {
        [.Accept: "application/json"]
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
