//
//  international_business_exampleApp.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import SwiftUI

@main
struct international_business_exampleApp: App {    
    let useCaseProvider = UseCaseProvider(serviceProvider: ServiceProvider())

    var body: some Scene {
        WindowGroup {
            ProductsView(viewModel: ProductsViewModel(useCaseProvider: useCaseProvider)).environmentObject(useCaseProvider)
        }
    }
}
