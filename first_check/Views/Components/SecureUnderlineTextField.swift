//
//  SecureUnderlineTextField.swift
//  First Check
//
//  Created by Raheem Campbell on 7/5/24.
//

import SwiftUI

struct SecureUnderlineTextField: View {
    var label: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                 
                    .foregroundColor(.black)
                
                SecureField(placeholder, text: $text)
                    .padding(.leading, 8)
            }
            .padding(.bottom, 8)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.3)), // Lighter gray color
                alignment: .bottom
            )
        }
    }
}
