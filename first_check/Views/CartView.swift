//
//  CartView.swift
//  first_check
//
//  Created by Raheem Campbell on 7/8/24.
//

import SwiftUI
import SwiftData

struct CartView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var carts: [Cart] // Use default query without predicates for fetching all carts
    @State private var showingAddCart = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(carts) { cart in
                    NavigationLink(destination: ItemView()) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(cart.name)
                                    .font(.headline)
                                Text("Cash: $\(cart.cash, specifier: "%.2f")")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteCarts)
            }
            .navigationTitle("Carts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddCart = true }) {
                        Label("Add Cart", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCart) {
                AddCartView()
            }
        }
    }
    
    private func deleteCarts(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(carts[index])
            }
            do {
                try modelContext.save()
            } catch {
                print("Error deleting cart: \(error.localizedDescription)")
            }
        }
    }
}

//#Preview {
//    CartView()
//        .modelContainer(for: [Cart.self, Item.self])
//}
//

