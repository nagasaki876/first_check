//
//  ItemDetailView.swift
//  First Check
//
//  Created by Raheem Campbell on 7/6/24.
//

import SwiftUI
import SwiftData

struct ItemDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var item: Item
    
    var body: some View {
        Form {
            Section(header: Text("Item Details")) {
                TextField("Name", text: $item.name)
                TextField("Price", value: $item.price, formatter: NumberFormatter.currency)
                Stepper(value: $item.quantity, in: 1...99) {
                    Text("Quantity: \(item.quantity)")
                }
            }
            Section {
                Button(action: {
                    do {
                        try modelContext.save()
                    } catch {
                        print("Error saving item: \(error.localizedDescription)")
                    }
                }) {
                    Text("Save")
                }
            }
        }
        .navigationTitle("Item Details")
    }
}

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}


//#Preview {
//    NavigationView {
//        let mockItem = Item(name: "Sample Item", price: 10.0, quantity: 5)
//        ItemDetailView(item: mockItem)
//            .modelContainer(for: [Item.self])
//    }
//}

