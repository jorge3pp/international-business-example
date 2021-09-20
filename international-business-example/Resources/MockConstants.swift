//
//  MockConstants.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import Foundation

enum MockConstants {
    static let rate = Rate(from: "AUD", to: "CAD", rate: "0.86")
    static let transaction = Transaction(sku: "T2006", amount: "10.00", currency: "USD")
}
