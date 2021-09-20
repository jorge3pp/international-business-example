//
//  RatesRemoteService.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import Combine
import ApiManager

class RatesRemoteService: RatesServiceProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func getCurrencyRates(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Rate], Error> {
        apiClient.send(GetRatesRequest(with: headerProtocol))
    }
}
