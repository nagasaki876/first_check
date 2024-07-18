//
//  AddItemView.swift
//  First Check
//
//  Created by Raheem Campbell on 7/6/24.
//

import SwiftUI
import SwiftData

struct AddItemView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var quantity: Int = 1

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Name", text: $name)
                    TextField("Price", text: $price)
                        .keyboardType(.decimalPad)
                    HStack {
                        Text("Quantity")
                        Spacer()
                        Stepper(value: $quantity, in: 1...99) {
                            Text("\(quantity)")
                        }
                    }
                }
            }
            .navigationTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addItem()
                    }
                    .disabled(name.isEmpty || price.isEmpty)
                }
            }
        }
    }
    
    private func addItem() {
        guard let priceValue = Double(price) else { return }
        let newItem = Item(name: name, price: priceValue, quantity: quantity)
        modelContext.insert(newItem)
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving item: \(error.localizedDescription)")
        }
    }
}

#Preview {
    AddItemView()
        .modelContainer(for: [Item.self])
}

