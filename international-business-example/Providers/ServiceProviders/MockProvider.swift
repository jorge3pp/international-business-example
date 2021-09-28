//
//  MockProvider.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Foundation


struct MockProvider: ServiceProviderProtocol {
    let ratesService: RatesServiceProtocol
    let transactionsService: TransactionsServiceProtocol
    let calculateRatesService: CalculateRatesServiceProtocol
    
    init() {
        ratesService = RatesMockService()
        transactionsService = TransactionsMockService()
        /// TODO: Mock
        calculateRatesService = CalculateRatesDFSService()
    }
}
