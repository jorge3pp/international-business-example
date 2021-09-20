//
//  GetTransactionsRequest.swift
//  international-business-example
//
//  Created by Jorge Poveda on 20/9/21.
//

import Foundation
import ApiManager

struct GetTransactionsRequest: APIRequestProtocol {
    typealias Response = [Transaction]
    
    var method: HTTPMethodProtocol
    var baseURL: URL {
        URL(string: "http://quiet-stone-2094.herokuapp.com/transactions")!
    }
    
    init(with headerProtocol: HTTPHeaderProtocol) {
        method = GetMethod(
            requestHeaders: headerProtocol
        )
    }

    func convertPropertiesToBody() -> [String: Any] {
        [:]
    }
}
