//
//  HTTPError.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Foundation

public enum HTTPErrorType: Error, Equatable {
    case generic
    case unauthorized
    case forbidden

    static func checkAPIError(httpResponse: HTTPURLResponse) -> HTTPErrorType? {
        switch httpResponse.statusCode {
        case 200:
            return nil
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        default:
            return .generic
        }
    }
}
