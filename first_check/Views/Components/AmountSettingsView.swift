//
//  AmountSettingsView.swift
//  first_check
//
//  Created by Raheem Campbell on 7/9/24.
//

import SwiftUI
import SwiftData

struct AmountSettingsView: View {
    @Binding var initialAmount: Double
    @Binding var taxPercentage: Double
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Initial Amount")) {
                    TextField("Enter Initial Amount", value: $initialAmount, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Tax Percentage")) {
                    TextField("Enter Tax Percentage", value: $taxPercentage, format: .number)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        // Dismiss the view
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Dismiss the view
                    }
                }
            }
        }
    }
}

#Preview {
    AmountSettingsView(initialAmount: .constant(100.0), taxPercentage: .constant(10.0))
}
