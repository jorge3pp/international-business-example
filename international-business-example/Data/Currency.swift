//
//  Currency.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation

class Currency {
    public var id: String
    public var exchangeRates: [String: Decimal]

    public init(id: String, rates: [Rate]) {
        self.id = id
        self.exchangeRates = Currency.getRatesBased(in: id, from: rates)
    }
    
    private static func getRatesBased(in currency: String, from rates: [Rate]) -> [String: Decimal] {
        var currencyRates: [String: Decimal] = [:]
        rates.forEach {
            if (currency == $0.from && currencyRates[$0.to] == nil){
                currencyRates[$0.to] = $0.rate.toDecimalAmount()
            } else if (currency == $0.to && currencyRates[$0.from] == nil){
                currencyRates[$0.from] = NSNumber(floatLiteral: 1.0).decimalValue / $0.rate.toDecimalAmount()
            }
        }
        return currencyRates
    }
    
    func appendExchangeRate(id: String, rate: Decimal) {
        self.exchangeRates[id] = rate
    }
}
