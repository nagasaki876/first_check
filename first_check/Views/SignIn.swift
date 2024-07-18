//
//  SignIn.swift
//  First Check
//
//  Created by Raheem Campbell on 13/09/2023.
//

import SwiftUI


struct SignIn: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var signInSuccess = false // Track sign-up success
    
    var body: some View {
        NavigationStack { // Wrap your content in a NavigationView
            VStack {
                
                Image(
                    .logo
                )
                .padding(
                    .bottom,
                    60
                )
                
                Text(
                    "Sign In"
                )
                .font(.title)
                .fontWeight(.bold)
                .padding(
                    .bottom,
                    60
                )
                
                
                UnderlineTextField(
                    label: "Email",
                    placeholder: "Value",
                    text: $email
                )
                .padding(
                    .bottom,
                    12
                )
                
                SecureUnderlineTextField(
                    label: "Password",
                    placeholder: "Value",
                    text: $password
                )
                .padding(
                    .bottom,
                    60
                )
                
                Button{
                    
                } label: {
                    Text(
                        "Sign In"
                    )
                    .frame(
                        maxWidth: .infinity
                    )
                    .padding(
                        .vertical,
                        4
                    )
                }
                .buttonStyle(
                    .borderedProminent
                )
                .buttonBorderShape(
                    .capsule
                )
                .controlSize(
                    .regular
                )
                .padding(
                    .bottom,
                    20
                )
                
                HStack {
                    Text(
                        "Don't have an account?"
                    )
                    .font(
                        .caption
                    )
                    Button(
                        "Sign Up"
                    ){
                    }.font(
                        .caption
                    )
                }
            }
            
            
        }
        .padding()
        
        
        
    }
    
}



struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
