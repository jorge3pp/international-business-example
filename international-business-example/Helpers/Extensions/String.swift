//
//  String.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import Foundation

extension String {
    func toDecimalAmount() -> Decimal {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US") /// el formato que nos llega de API es este
        formatter.numberStyle = .decimal

        guard let number = formatter.number(from: self) else {
            return 0.0 /// Manage error in format
        }
        return number.decimalValue.rounded()
    }
}
