//
//  TransactionsServiceProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Combine

protocol TransactionsServiceProtocol {
    func getTransactions(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Transaction], Error>
}
