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
                viewModel.fetchRates()
            }).navigationTitle("Listado de productos")
        }
    }
}

// A view that shows the data for one Restaurant.
struct ProductRow: View {
    var product: Product

    var body: some View {
        NavigationLink(destination: ProductDetailsView(product: product)) {
            Text("\(product.id)")
        }
    }
}
