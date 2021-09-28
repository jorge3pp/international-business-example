//
//  CalculateRatesUseCaseIntegrationTests.swift
//  international-business-exampleTests
//
//  Created by Jorge Poveda on 28/9/21.
//

import ApiManager
import Foundation

@testable import international_business_example
import XCTest

class CalculateRatesUseCaseIntegrationTests: XCTestCase {
    private var getRatesUseCase: GetRatesUseCase!
    private var calculateRatesUseCase: CalculateRatesUseCase!

    override func setUpWithError() throws {
        let useCaseProvider = UseCaseProvider(serviceProvider: ServiceProvider())

        getRatesUseCase = useCaseProvider.getRatesUseCase
    }

    func test_calculateRatesUseCase() throws {
        // Given
        let calculatedCurrencies = calculateRatesUseCase.execute(with: MockConstants.rates)

        // Then
        XCTAssertNotNil(calculatedCurrencies)
    }
}
