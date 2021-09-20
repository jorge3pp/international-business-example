//
//  Transaction.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import Foundation

struct Transaction: Decodable {
    public var sku: String
    public var amount: String
    public var currency: String

    public init(sku: String, amount: String, currency: String) {
        self.sku = sku
        self.amount = amount
        self.currency = currency
    }
}
