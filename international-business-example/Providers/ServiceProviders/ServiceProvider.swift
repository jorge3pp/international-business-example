//
//  ServiceProvider.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Foundation
import ApiManager

struct ServiceProvider: ServiceProviderProtocol {
    let ratesService: RatesServiceProtocol
    let transactionsService: TransactionsServiceProtocol
    let calculateRatesService: CalculateRatesServiceProtocol
    
    init() {
        let apiClientBasic = APIClientBasic()
//        let apiClientSecurized = APIClientSecurized()
        
        ratesService = RatesRemoteService(apiClient: apiClientBasic)
        transactionsService = TransactionsRemoteService(apiClient: apiClientBasic)
        calculateRatesService = CalculateRatesDFSService()
    }
}
