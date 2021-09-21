//
//  ProductsDetailsViewModel.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation
import Combine

internal class ProductsDetailsViewModel: ObservableObject {
    private let getRatesUseCase : GetRatesUseCase
    let product: Product
    
    private var cancellable = Set<AnyCancellable>()
    
    public private(set) var currencies: [Currency] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    init(product: Product, useCaseProvider: UseCaseProvider) {
        self.product = product
        self.getRatesUseCase = useCaseProvider.getRatesUseCase
    }
    
    func fetchRates() {
        let _ = getRatesUseCase.execute()
            .sink(receiveCompletion: {_ in},
                  receiveValue: { currencies in
                    self.currencies = currencies
                  }).store(in: &cancellable)
    }
    
    func exchange(from: String, to: String, with: String) -> Decimal {
        guard let currency = currencies.filter{ $0.id == from }[safe: 0] else {
            return .zero
        }
        let rate = currency.exchangeRates[to] ?? NSDecimalNumber(floatLiteral: 1.0).decimalValue.rounded()
        return (with.toDecimalAmount() * rate).rounded()
    }
    
    func getTotalAmount(currency: String) -> Decimal {
        product.transactions.reduce(Decimal.zero, { total, transaction in
            total + exchange(from: transaction.currency, to: "EUR", with: transaction.amount)
        })
    }
}
