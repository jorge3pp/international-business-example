//
//  ApplicationJSONBody.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public struct ApplicationJSONBody: HTTPBodyProtocol {
    public func create(paramsDictionary: [String: Any]) -> Data {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: paramsDictionary, options: .prettyPrinted) else {
            return Data()
        }

        return jsonData
    }
}
