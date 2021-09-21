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
        List(viewModel.products) { item in
            ProductRow(product: item)
        }.onAppear(perform: {
            viewModel.fetchTransactions()
        })
    }
}

// A view that shows the data for one Restaurant.
struct ProductRow: View {
    var product: Product

    var body: some View {
        Text("\(product.id)")
    }
}
