//
//  GetMethod.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public struct GetMethod: HTTPMethodProtocol {
    public var method: String {
        "GET"
    }

    private var requestHeaders: HTTPHeaderProtocol

    public init(requestHeaders: HTTPHeaderProtocol) {
        self.requestHeaders = requestHeaders
    }

    public func setURLRequest(urlRequest: URLRequest, paramsDictionary _: [String: Any]) -> URLRequest {
        var urlRequestResult = urlRequest

        urlRequestResult.httpMethod = method
        urlRequestResult.setHeaders(headers: requestHeaders.headers)

        return urlRequestResult
    }
}
