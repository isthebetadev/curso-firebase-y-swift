//
//  LoginWithEmailView.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
//

import SwiftUI

struct LoginWithEmailView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            
            Group {
                Text("Welcome back")
                    .bold()
            }
            .padding(.top, 66)
            .font(.title)
            .fontDesign(.monospaced)
            .tint(.primary)
            
            Group {
                Text("Log in to access your links.")
                    .tint(.secondary)
                    .padding(.bottom, 32)
                TextField("Add your email", text: $email)
                    .keyboardType(.emailAddress)
                SecureField("Add your password", text: $password)
                Button(action: {print("Login form submit")}, label: {
                    Text("Login")
                })
                .padding(.top, 16)
                .buttonStyle(.bordered)
                .tint(.blue)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
            
        }
    }
}

#Preview {
    LoginWithEmailView()
}
