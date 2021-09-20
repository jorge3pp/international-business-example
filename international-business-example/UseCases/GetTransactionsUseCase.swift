//
//  GetTransactionsUseCase.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Combine
import Foundation

final class GetTransactionsUseCase {
    let headerProtocol: HTTPHeaderProtocol
    let service: TransactionsServiceProtocol

    init(service: TransactionsServiceProtocol, headerProtocol: HTTPHeaderProtocol) {
        self.service = service
        self.headerProtocol = headerProtocol
    }

    func execute() -> AnyPublisher<[Transaction], Error> {
        service.getTransactions(with: headerProtocol)
    }
}
