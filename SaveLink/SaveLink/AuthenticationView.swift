//
//  ContentView.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login
    
    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    
    @State private var authenticationSheetView: AuthenticationSheetView?
    
    var body: some View {
        VStack {
            Image("AppLogo")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("Wellcome to Save Link")
                .font(.title)
                .bold()
                .fontDesign(.monospaced)
                .frame(width: 150)
                .padding()
            
            Button(action: { authenticationSheetView = .login }, label: {
                Label("Sign in with email", systemImage: "envelope.fill")
            })
            .tint(.black)
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button(action: { authenticationSheetView = .register }, label: {
                    Text("You do not have an account?")
                    Text("Sign up")
                        .underline()
                })
                .tint(.black)
            }
            
        }
        .sheet(item: $authenticationSheetView, content: { sheet in
            switch sheet {
                case .login:
                    Text("Login")
                case .register:
                    Text("Register")
            }
        })
    }
}

#Preview {
    AuthenticationView()
}
