//
//  UseCaseProvider.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Foundation
import ApiManager

struct UseCaseProvider {
    let getRatesUseCase: GetRatesUseCase

    init(serviceProvider: ServiceProviderProtocol) {
        getRatesUseCase = GetRatesUseCase(
            service: serviceProvider.ratesService, headerProtocol: ApplicationJSONHeader())
    }
}
