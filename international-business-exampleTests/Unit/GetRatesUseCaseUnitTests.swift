//
//  GetRatesUseCaseUnitTests.swift
//  international-business-exampleTests
//
//  Created by Jorge Poveda on 20/9/21.
//

import ApiManager
import Foundation

@testable import international_business_example
import XCTest

class GetRatesUseCaseUnitTests: XCTestCase {
    private var getRatesUseCase: GetRatesUseCase!
    private var useCaseProvider: UseCaseProvider!

    override func setUpWithError() throws {
        useCaseProvider = UseCaseProvider(serviceProvider: MockProvider())

        getRatesUseCase = useCaseProvider.getRatesUseCase
    }

    func test_getRatesUseCase() throws {
        // Given
        let publisher = getRatesUseCase.execute()

        // When
        let expectedResult = try awaitPublisher(publisher)

        // Then
        XCTAssertEqual(expectedResult, [MockConstants.rate])
    }
}
