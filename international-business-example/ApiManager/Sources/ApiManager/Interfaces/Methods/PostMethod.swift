//
//  PostMethod.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public struct PostMethod: HTTPMethodProtocol {
    public var method: String {
        "POST"
    }

    private var requestHeaders: HTTPHeaderProtocol
    private var requestBody: HTTPBodyProtocol

    public init(requestHeaders: HTTPHeaderProtocol, requestBody: HTTPBodyProtocol) {
        self.requestHeaders = requestHeaders
        self.requestBody = requestBody
    }

    public func setURLRequest(urlRequest: URLRequest, paramsDictionary: [String: Any]) -> URLRequest {
        var urlRequestResult = urlRequest

        /// TODO: Implement POSTMethod construction

        return urlRequestResult
    }
}
