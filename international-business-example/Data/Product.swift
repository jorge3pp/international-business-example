//
//  Product.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation

struct Product: Identifiable {
    public var id: String
    public var transactions: [Transaction]
//    public var currency: String?
//    public var totalAmount: String?

    public init(id: String, transactions: [Transaction]) {
        self.id = id
        self.transactions = transactions
    }
    
    func getTotalAmount() -> Decimal {
        /// TODO
        return Decimal.zero
    }
    
    static func createProductList(from transactions: [Transaction]) -> [Product] {
        var productList: [Product] = []
        
        let uniqueSkuIdentifiers = Array(Set(transactions.map{ return $0.sku }))
        
        uniqueSkuIdentifiers.forEach({ sku in
            let filteredTransactions = transactions.filter({ $0.sku == sku})
            productList.append(Product(id: sku, transactions: filteredTransactions))
        })
        
        return productList
    }
}

extension Product: Equatable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        lhs.id == rhs.id && lhs.transactions == rhs.transactions
    }
}
