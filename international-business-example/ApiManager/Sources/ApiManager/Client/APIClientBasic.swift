//
//  APIClientBasic.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Combine
import Foundation

public class APIClientBasic: APIClientProtocol {
    public var urlSession: URLSession

    public init() {
        urlSession = URLSession(configuration: .default)
    }

    public func send<T>(_ request: T) -> AnyPublisher<T.Response, Error> where T: APIRequestProtocol {
        make(urlRequest: request.configureURLRequest())
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
