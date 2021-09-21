//
//  ProductDetailsView.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import SwiftUI

struct ProductDetailsView: View {
    @ObservedObject var viewModel: ProductsDetailsViewModel
    
    var body: some View {
        Text("Total amount \(viewModel.getTotalAmount(currency: "EUR").description) EUR").bold()
        
        List(viewModel.product.transactions) { transaction in
            VStack(alignment: .leading) {
                Text("\(viewModel.exchange(from: transaction.currency, to: "EUR", with: transaction.amount).description) EUR")
                Text("\(viewModel.exchange(from: transaction.currency, to: "USD", with: transaction.amount).description) USD")
                Text("\(viewModel.exchange(from: transaction.currency, to: "AUD", with: transaction.amount).description) AUD")
                Text("\(viewModel.exchange(from: transaction.currency, to: "CAD", with: transaction.amount).description) CAD")
            }
        }.onAppear {
            viewModel.fetchRates()
        }.navigationTitle("Transaction")
    }
}
