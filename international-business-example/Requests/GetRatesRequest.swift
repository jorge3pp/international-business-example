//
//  GetRatesRequest.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation
import ApiManager

struct GetRatesRequest: APIRequestProtocol {
    typealias Response = [Rate]
    
    var method: HTTPMethodProtocol
    var baseURL: URL {
        URL(string: "http://quiet-stone-2094.herokuapp.com/rates")!
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
