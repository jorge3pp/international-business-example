//
//  Decimal.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation

extension Decimal {
    static var one: Decimal {
        NSDecimalNumber(floatLiteral: 1.0).decimalValue.rounded()
    }
    
    mutating func round(_ scale: Int = 2, _ roundingMode: NSDecimalNumber.RoundingMode = .bankers) {
        var localCopy = self
        NSDecimalRound(&self, &localCopy, scale, roundingMode)
    }

    func rounded(_ scale: Int = 2, _ roundingMode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var result = Decimal()
        var localCopy = self
        NSDecimalRound(&result, &localCopy, scale, roundingMode)
        return result
    }
}
