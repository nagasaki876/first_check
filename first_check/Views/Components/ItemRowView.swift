//
//  ItemRowView.swift
//  first_check
//
//  Created by Raheem Campbell on 7/9/24.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item
    let taxPercentage: Double

    private var taxInclusivePrice: Double {
        item.price * (1 + taxPercentage / 100)
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                Text("Price: \(item.price, specifier: "%.2f")")
                Text("Quantity: \(item.quantity)")
                Text("Total: \(taxInclusivePrice * Double(item.quantity), specifier: "%.2f")")
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ItemRowView(item: Item(name: "Sample Item", price: 10.0, quantity: 2), taxPercentage: 10.0)
}
