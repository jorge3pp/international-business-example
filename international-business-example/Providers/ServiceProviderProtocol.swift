//
//  ServiceProviderProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import Foundation


protocol ServiceProviderProtocol {
    var ratesService: RatesServiceProtocol { get }
    var transactionsService: TransactionsServiceProtocol { get }
}
