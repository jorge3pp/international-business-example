//
//  MockConstants.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import Foundation

enum MockConstants {
    static let rate = Rate(from: "AUD", to: "CAD", rate: "0.86")
    static let transaction1 = Transaction(sku: "T2006", amount: "10.00", currency: "USD")
    static let transaction2 = Transaction(sku: "F1007", amount: "1.50", currency: "EUR")
    static let transaction3 = Transaction(sku: "F1007", amount: "3.50", currency: "CAD")
    static let transactions = [transaction1, transaction2, transaction3]
}
