//
//  ProductsView.swift
//  international-business-example
//
//  Created by Jorge Poveda on 16/9/21.
//

import SwiftUI

struct ProductsView: View {
    @ObservedObject var viewModel: ProductsViewModel

    var body: some View {
        NavigationView {
            List(viewModel.products) { item in
                ProductRow(product: item)
            }.onAppear(perform: {
                viewModel.fetchTransactions()
            }).navigationTitle("Product's List")
        }
    }
}

// A view that shows the data for one Restaurant.
struct ProductRow: View {
    var product: Product
    @EnvironmentObject var useCaseProvider: UseCaseProvider

    var body: some View {
        NavigationLink(destination: ProductDetailsView(viewModel: ProductsDetailsViewModel(product: product, useCaseProvider: useCaseProvider))) {
            Text("\(product.id)")
        }
    }
}
