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
    
    init() {
        let apiClientBasic = APIClientBasic()
        
        ratesService = RatesRemoteService(apiClient: apiClientBasic)
    }
}
