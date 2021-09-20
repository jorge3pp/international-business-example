//
//  TransactionsRemoteService.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Combine

class TransactionsRemoteService: TransactionsServiceProtocol {
    private let apiClient: APIClientProtocol

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func getTransactions(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Transaction], Error> {
        apiClient.send(GetTransactionsRequest(with: headerProtocol))
    }
}
