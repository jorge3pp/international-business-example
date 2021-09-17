//
//  APIClientSecurized.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Combine
import Foundation

public class APIClientSecurized: APIClientProtocol {
    public let urlSession: URLSession

    public init(apiClient _: APIClientProtocol) {
        urlSession = URLSession(configuration: .default)
    }

    public func send<T: APIRequestProtocol>(_ request: T) -> AnyPublisher<T.Response, Error> {
        self.make(urlRequest: self.getSecurizedURLRequest(with: "token", to: request))
            .catch { error -> Fail<Data, Error> in
                return Fail(error: error)
            }
            .decode(type: T.Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func getSecurizedURLRequest<T: APIRequestProtocol>(with token: String, to request: T) -> URLRequest {
        var urlRequest = request.configureURLRequest()
        urlRequest.addValue(token, forHTTPHeaderField: "Authorization")
        return urlRequest
    }
}
