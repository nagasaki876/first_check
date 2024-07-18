//
//  Collection2.swift
//  First Check
//
//  Created by Raheem Campbell on 7/5/24.
//

import SwiftUI
import SwiftData

struct ItemView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var showingAddItem = false
    @State private var showingSettings = false
    @State private var initialAmount: Double = UserDefaults.standard.double(forKey: "initialAmount")
    @State private var taxPercentage: Double = UserDefaults.standard.double(forKey: "taxPercentage")

    private var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    private var totalTax: Double {
        totalPrice * (taxPercentage / 100)
    }
    
    private var finalAmount: Double {
        initialAmount - totalPrice + totalTax
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    VStack {
                        Spacer()
                        Text("No items available")
                            .font(.title)
                            .padding()
                        Button(action: { showingAddItem = true }) {
                            Text("Add Item")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(items) { item in
                            NavigationLink(destination: ItemDetailView(item: item)) {
                                ItemRowView(item: item, taxPercentage: taxPercentage)
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(PlainListStyle())
                }
                
                VStack {
                    Text("Initial Amount: \(initialAmount, specifier: "%.2f")")
                    Text("Total Price: \(totalPrice, specifier: "%.2f")")
                    Text("Total Tax: \(totalTax, specifier: "%.2f")")
                    Text("Final Amount: \(finalAmount, specifier: "%.2f")")
                }
                .padding()
                .background(Color.white)
            }
            .background(Color.white.edgesIgnoringSafeArea(.all))
            .navigationTitle("Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingSettings = true }) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddItem = true }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView()
            }
            .sheet(isPresented: $showingSettings) {
                AmountSettingsView(initialAmount: $initialAmount, taxPercentage: $taxPercentage)
                    .onDisappear {
                        saveSettings()
                    }
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
            do {
                try modelContext.save()
            } catch {
                print("Error deleting item: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveSettings() {
        UserDefaults.standard.set(initialAmount, forKey: "initialAmount")
        UserDefaults.standard.set(taxPercentage, forKey: "taxPercentage")
    }
}

//#Preview {
//    ItemView()
//        .modelContainer(for: [Item.self])
//}

