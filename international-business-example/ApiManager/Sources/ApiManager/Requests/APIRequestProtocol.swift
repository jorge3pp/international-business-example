//
//  APIRequestProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public protocol APIRequestProtocol {
    associatedtype Response: Decodable

    var baseURL: URL { get }
    var method: HTTPMethodProtocol { get }

    func convertPropertiesToBody() -> [String: Any]
}

extension APIRequestProtocol {
    func configureURLRequest() -> URLRequest {
        method.setURLRequest(
            urlRequest: URLRequest(url: baseURL),
            paramsDictionary: convertPropertiesToBody()
        )
    }
}
