//
//  Rate.swift
//  international-business-example
//
//  Created by Jorge Poveda on 18/9/21.
//

import Foundation


struct Rate: Decodable {
    public var from: String
    public var to: String
    public var rate: String

    public init(from: String, to: String, rate: String) {
        self.from = from
        self.to = to
        self.rate = rate
    }
}
