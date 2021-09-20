//
//  RatesServiceProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import ApiManager
import Combine

protocol RatesServiceProtocol {
    func getCurrencyRates(with headerProtocol: HTTPHeaderProtocol) -> AnyPublisher<[Rate], Error>
}
