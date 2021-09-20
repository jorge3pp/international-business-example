//
//  TransactionsMockService.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Combine

class TransactionsMockService: TransactionsServiceProtocol {
    func getTransactions(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Transaction], Error> {
        Just([MockConstants.transaction])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
