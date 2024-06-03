//
//  LoginWithEmailView.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
//

import SwiftUI

struct LoginWithEmailView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            
            DismissView()
                .padding(.top, 10)
            
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
                Button(action: {
                    print("Login form submit")
                    authenticationViewModel.login(email: email, password: password)
                }, label: {
                    Text("Login")
                })
                .padding(.top, 16)
                .buttonStyle(.bordered)
                .tint(.blue)
                if let messageError = authenticationViewModel.messageError {
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundStyle(.red)
                        .padding(.top, 20)
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 64)
            
            Spacer()
            
        }
    }
}

#Preview {
    LoginWithEmailView(authenticationViewModel: AuthenticationViewModel())
}
