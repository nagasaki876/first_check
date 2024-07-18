//
//  ListTile.swift
//  First Check
//
//  Created by Raheem Campbell on 10/28/23.
//

import SwiftUI

struct ListTile: View {
    
    let title: String
    let subtitle: String
    let amount: String
    
    var body: some View {
        HStack {
            Text(amount)
                .font(.headline)
                .foregroundColor(.black)
            
            VStack (alignment: .leading) {
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
            }
            .padding(.leading, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

#Preview {
    ListTile(title: "Mackerel", subtitle: "120.00/pc", amount: "1")
}
