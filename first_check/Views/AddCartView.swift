//
//  AddCartView.swift
//  first_check
//
//  Created by Raheem Campbell on 7/8/24.
//

import SwiftUI
import SwiftData

struct AddCartView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var cash = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Cart Details")) {
                    TextField("Name", text: $name)
                    TextField("Cash", text: $cash)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Add Cart") {
                        addCart()
                    }
                }
            }
            .navigationTitle("Add Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    private func addCart() {
        let newCart = Cart(name: name, cash: Double(cash) ?? 0)
        modelContext.insert(newCart)
        dismiss()
    }
}

#Preview {
    AddCartView()
        .modelContainer(for: [Cart.self])
}
