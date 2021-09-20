//
//  GetRatesUseCaseIntegrationTests.swift
//  international-business-exampleTests
//
//  Created by Jorge Poveda on 18/9/21.
//

import ApiManager
import Foundation

@testable import international_business_example
import XCTest

class GetRatesUseCaseIntegrationTests: XCTestCase {
    private var getRatesUseCase: GetRatesUseCase!
    var useCaseProvider: UseCaseProvider!

    override func setUpWithError() throws {
        useCaseProvider = UseCaseProvider(serviceProvider: ServiceProvider())

        getRatesUseCase = useCaseProvider.getRatesUseCase
    }

    func test_getRatesUseCase() throws {
        // Given
        let publisher = getRatesUseCase.execute()

        // When
        let expectedResult = try awaitPublisher(publisher)

        // Then
        XCTAssertNotNil(expectedResult)
    }
}
