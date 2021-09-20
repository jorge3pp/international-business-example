//
//  GetRatesUseCase.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import ApiManager
import Combine
import Foundation

final class GetRatesUseCase {
    let headerProtocol: HTTPHeaderProtocol
    let service: RatesServiceProtocol

    init(service: RatesServiceProtocol, headerProtocol: HTTPHeaderProtocol) {
        self.service = service
        self.headerProtocol = headerProtocol
    }

    func execute() -> AnyPublisher<[Rate], Error> {
        service.getCurrencyRates(with: headerProtocol)
    }
}
