//
//  HTTPMethodProtocol.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public protocol HTTPMethodProtocol {
    var method: String { get }

    func setURLRequest(urlRequest: URLRequest, paramsDictionary: [String: Any]) -> URLRequest
}
