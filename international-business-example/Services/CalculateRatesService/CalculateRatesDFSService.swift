//
//  CalculateRatesDFSService.swift
//  international-business-example
//
//  Created by Jorge Poveda on 28/9/21.
//

import Foundation

class CalculateRatesDFSService: CalculateRatesServiceProtocol {
    func calculateRates(with rates: [Rate]) -> [Currency] {
        print("List of Rates provided by the UseCase:\n", rates)
        let currencies = currenciesSetup(with: rates)
        let graph = createGraph(currencies: currencies)
        return graph.currencies
    }
    
    private func currenciesSetup(with rates: [Rate]) -> [Currency] {
        /// I'm working with the premise that a currency returned by the API maybe isn't in both at the same time (from-to)
        let listOfCurrencies = rates.map{ $0.from } + rates.map{ $0.to }
        let uniqueCurrencyIdentifiers = Array(Set(listOfCurrencies))
                
        var currencies: [Currency] = []
        
        uniqueCurrencyIdentifiers.forEach { currency in
            currencies.append(Currency(id: currency, rates: rates))
        }
        
        return currencies
    }
    
    private func createGraph(currencies: [Currency]) -> AdjacencyList<String> {
        let adjacencyList = AdjacencyList<String>()
        currencies.forEach{ currency in
            let currencyVertex = adjacencyList.createVertex(data: currency.id)
            currency.exchangeRates.keys.forEach{ exchangeKey in
                let toVertex = adjacencyList.createVertex(data: exchangeKey)
                adjacencyList.add(from: currencyVertex, to: toVertex, weight: currency.exchangeRates[exchangeKey])
            }
        }
        
        adjacencyList.completeGraph()
        
        print("Lista de Vértices:\n", adjacencyList.description)
        return adjacencyList
    }
}
