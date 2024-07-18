//
//  CollectionCard.swift
//  First Check
//
//  Created by Raheem Campbell on 26/10/2023.
//

import SwiftUI

struct Card: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack (alignment: .leading) {
            
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
               
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(10)
        .frame(width: 150, height: 100, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}


#Preview {
    Card(title: "Shoppers Fair", subtitle: "Duhaney Park")
}
