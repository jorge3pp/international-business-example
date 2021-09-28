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
    let calculateRatesService: CalculateRatesServiceProtocol

    init(service: RatesServiceProtocol, calculateRatesService: CalculateRatesServiceProtocol, headerProtocol: HTTPHeaderProtocol) {
        self.service = service
        self.headerProtocol = headerProtocol
        self.calculateRatesService = calculateRatesService
    }

    func execute() -> AnyPublisher<[Currency], Error> {
        service.getCurrencyRates(with: headerProtocol).map{
            self.calculateRatesService.calculateRates(with: $0)
        }.eraseToAnyPublisher()
    }
}
