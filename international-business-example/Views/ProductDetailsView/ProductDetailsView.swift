//
//  ProductDetailsView.swift
//  international-business-example
//
//  Created by Jorge Poveda on 21/9/21.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        List(product.transactions) { item in
            TransactionRow(transaction: item)
        }.navigationTitle("Transferencias")
    }
}


struct TransactionRow: View {
    var transaction: Transaction

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(transaction.amount) \(transaction.currency)")
            Text("\(transaction.sku)")
        }
    }
}
