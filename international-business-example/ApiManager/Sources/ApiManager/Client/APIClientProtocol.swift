//
//  APIClientProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Combine
import Foundation

public protocol APIClientProtocol {
    var urlSession: URLSession { get }
    func send<T: APIRequestProtocol>(_ request: T) -> AnyPublisher<T.Response, Error>
}

public extension APIClientProtocol {
    func make(urlRequest: URLRequest) -> AnyPublisher<Data, Error> {
        urlSession
            .dataTaskPublisher(for: urlRequest)
            .tryMap { response -> Data in
                if let errorResponse = HTTPErrorType.checkAPIError(httpResponse: response.response as! HTTPURLResponse) {
                    throw errorResponse
                }
                return response.data
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
