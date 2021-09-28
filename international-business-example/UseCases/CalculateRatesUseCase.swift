//
//  CalculateRatesUseCase.swift
//  international-business-example
//
//  Created by Jorge Poveda on 28/9/21.
//

import Foundation

final class CalculateRatesUseCase {
    let service: CalculateRatesServiceProtocol

    init(service: CalculateRatesServiceProtocol) {
        self.service = service
    }

    func execute(with rates: [Rate]) -> [Currency] {
        service.calculateRates(with: rates)
    }
}
