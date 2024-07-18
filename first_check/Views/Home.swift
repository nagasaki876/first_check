//
//  Home.swift
//  First Check
//
//  Created by Raheem Campbell on 20/08/2023.
//

import SwiftUI

struct Home: View {
    
    @State private var isPresentingAddToCartView = false
    @State private var isPresentingBarcodeScannerView = false
    @State private var isShowingScanner = false
    
    var body: some View {
        
        TabView {
           
            ItemView()
                .tabItem{
                    Label("Cart", systemImage: "cart")
                } 
            SettingsView()
                .tabItem {
                    Label("Settings",systemImage:"gear")
                    
                }
        }
    }
}


#Preview {
    Home()
        .modelContainer(for: [Item.self])
}

