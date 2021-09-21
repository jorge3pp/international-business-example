//
//  GetRatesUseCase.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import ApiManager
import Combine
import Foundation

final class GetRatesUseCase {
    let headerProtocol: HTTPHeaderProtocol
    let service: RatesServiceProtocol

    init(service: RatesServiceProtocol, headerProtocol: HTTPHeaderProtocol) {
        self.service = service
        self.headerProtocol = headerProtocol
    }

    func execute() -> AnyPublisher<[Currency], Error> {
        service.getCurrencyRates(with: headerProtocol)
            .map { self.getAllRates(rates: $0)}
            .eraseToAnyPublisher()
    }
    
    private func getAllRates(rates: [Rate]) -> [Currency] {
        /// I'm working with the premise that a currency returned by the API maybe isn't in both at the same time (from-to)
        let listOfCurrencies = rates.map{ $0.from } + rates.map{ $0.to }
        let uniqueCurrencyIdentifiers = Array(Set(listOfCurrencies))
                
        var currencies: [Currency] = []
        
        uniqueCurrencyIdentifiers.forEach { currency in
            currencies.append(Currency(id: currency, rates: rates))
        }
        
        currencies.forEach{ currency in
            currency.exchangeRates.keys.forEach { currencyKnownRates in
                uniqueCurrencyIdentifiers.forEach{ identifier in
                    if(!currencyKnownRates.contains(identifier) && currency.id != identifier){
                        currency.appendExchangeRate(id: identifier, rate: completeCurrencyRates(alreadyChecked: [] ,currencies: currencies, from: currency, to: currencies.filter{ $0.id == identifier}[0]))
                    }
                }
            }
        }
        
        return currencies
    }
    
    private func completeCurrencyRates(alreadyChecked: [Currency], currencies: [Currency], from: Currency, to: Currency, inversion: Bool = false) -> Decimal {
        if (currencies.isEmpty){
            return NSNumber(floatLiteral: 1.0).decimalValue
        }
        let fromCurrencyKeys = from.exchangeRates.keys
        if fromCurrencyKeys.contains(to.id){
            return inversion ? (1/from.exchangeRates[to.id]!): from.exchangeRates[to.id]!
        } else {
            var alreadyCheckedCurrency = alreadyChecked
            if(alreadyCheckedCurrency.filter{$0.id == from.id}.count == 0){
                alreadyCheckedCurrency.append(from)
            }
            var coincidences: [String] = []
            
            fromCurrencyKeys.forEach{
                if(alreadyCheckedCurrency.map{$0.id}.contains($0)){} else {
                    coincidences.append($0)
                }
            }
            
            if coincidences.count != 0 {
                let coincidence = coincidences[Int.random(in: 0...coincidences.count-1)]
                let newFrom = currencies.filter{ $0.id == coincidence }[0]
                return completeCurrencyRates(alreadyChecked: alreadyCheckedCurrency, currencies: currencies, from: newFrom, to: to, inversion: inversion) * from.exchangeRates[coincidence]!
            } else {
                if(alreadyCheckedCurrency.count == currencies.count){
                    alreadyCheckedCurrency = []
                }
                return completeCurrencyRates(alreadyChecked: alreadyCheckedCurrency, currencies: currencies, from: to, to: from, inversion: true)
            }
        }
    }
}
