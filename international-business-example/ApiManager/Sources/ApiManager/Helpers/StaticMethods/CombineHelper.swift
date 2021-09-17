//
//  CombineHelper.swift
//  international-business-example
//
//  Created by Jorge Poveda on 17/9/21.
//

import Combine

struct CombineHelper {
    static func just<T>(_ value: T) -> AnyPublisher<T, Error> {
        Just(value)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    static func fail<T>(_ error: Error) -> AnyPublisher<T, Error> {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
}
