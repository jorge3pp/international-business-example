//
//  GetTransactionsUseCaseUnitTest.swift
//  international-business-exampleTests
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Foundation

@testable import international_business_example
import XCTest

class GetTransactionsUseCaseUnitTest: XCTestCase {
    private var getTransactionsUseCase: GetTransactionsUseCase!
    private var useCaseProvider: UseCaseProvider!

    override func setUpWithError() throws {
        useCaseProvider = UseCaseProvider(serviceProvider: MockProvider())

        getTransactionsUseCase = useCaseProvider.getTransactionsUseCase
    }

    func test_getRatesUseCase() throws {
        // Given
        let publisher = getTransactionsUseCase.execute()

        // When
        let expectedResult = try awaitPublisher(publisher)

        // Then
        XCTAssertEqual(expectedResult, MockConstants.transactions)
    }
}
