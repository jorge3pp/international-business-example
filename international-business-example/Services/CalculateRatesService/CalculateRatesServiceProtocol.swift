//
//  CalculateRatesServiceProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 28/9/21.
//

protocol CalculateRatesServiceProtocol {
    func calculateRates(with rates: [Rate]) -> [Currency]
}
