//
//  URLRequest.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

extension URLRequest {
    mutating func setHeaders(headers: [RequestHeaderType: String]) {
        headers.forEach { (key: RequestHeaderType, value: String) in
            self.setValue(value, forHTTPHeaderField: key.rawValue)
        }
    }
}
