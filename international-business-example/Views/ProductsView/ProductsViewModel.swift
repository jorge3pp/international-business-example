//
//  ProductsViewModel.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import Foundation
import Combine
import ApiManager

internal class ProductsViewModel: ObservableObject {
    private let getTransactionsUseCase : GetTransactionsUseCase
    private let useCaseProvider : UseCaseProvider
    
    private var cancellable = Set<AnyCancellable>()
    
    public private(set) var products: [Product] = [] {
        willSet {
            self.objectWillChange.send()
        }
    }
    init(useCaseProvider: UseCaseProvider) {
        self.useCaseProvider = useCaseProvider
        self.getTransactionsUseCase = useCaseProvider.getTransactionsUseCase
    }
    
    func fetchTransactions() {
        let _ = getTransactionsUseCase.execute()
            .sink(receiveCompletion: {_ in},
                  receiveValue: { transactions in
                    self.products = Product.createProductList(from: transactions)
                  }).store(in: &cancellable)
    }
}
