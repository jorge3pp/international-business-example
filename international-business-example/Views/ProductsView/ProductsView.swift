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
        List(viewModel.transactions) { item in
            TransactionRow(transaction: item)
        }.onAppear(perform: {
            viewModel.fetchTransactions()
            viewModel.fetchRates()
        })
    }
}

// A view that shows the data for one Restaurant.
struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        Text("\(transaction.sku)")
    }
}
