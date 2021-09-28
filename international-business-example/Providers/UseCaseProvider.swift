//
//  UseCaseProvider.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Foundation
import ApiManager

class UseCaseProvider: ObservableObject {
    @Published var getRatesUseCase: GetRatesUseCase
    @Published var getTransactionsUseCase: GetTransactionsUseCase
    @Published var calculateRatesUseCase: CalculateRatesUseCase

    init(serviceProvider: ServiceProviderProtocol) {
        getRatesUseCase = GetRatesUseCase(
            service: serviceProvider.ratesService, headerProtocol: ApplicationJSONHeader())
        getTransactionsUseCase = GetTransactionsUseCase(service: serviceProvider.transactionsService, headerProtocol: ApplicationJSONHeader())
        calculateRatesUseCase = CalculateRatesUseCase(service: serviceProvider.calculateRatesService)
    }
}
