//
//  MockConstants.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import Foundation

enum MockConstants {
    static let rate1 = Rate(from: "EUR", to: "CAD", rate: "1.21")
    static let rate2 = Rate(from: "CAD", to: "EUR", rate: "0.83")
    static let rate3 = Rate(from: "EUR", to: "USD", rate: "0.54")
    static let rate4 = Rate(from: "USD", to: "EUR", rate: "1.85")
    static let rate5 = Rate(from: "CAD", to: "AUD", rate: "1.06")
    static let rate6 = Rate(from: "AUD", to: "CAD", rate: "0.94")
    static let rates = [rate1, rate2, rate3, rate4, rate5, rate6]
    
    static let transaction1 = Transaction(sku: "T2006", amount: "10.00", currency: "USD")
    static let transaction2 = Transaction(sku: "F1007", amount: "1.50", currency: "EUR")
    static let transaction3 = Transaction(sku: "F1007", amount: "3.50", currency: "CAD")
    static let transactions = [transaction1, transaction2, transaction3]
}
