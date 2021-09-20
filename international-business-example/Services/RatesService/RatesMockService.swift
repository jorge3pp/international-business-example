//
//  RatesMockService.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Combine
import ApiManager

class RatesMockService: RatesServiceProtocol {
    func getCurrencyRates(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Rate], Error> {
        Just([MockConstants.rate])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
