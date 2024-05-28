//
//  ContentView.swift
//  SaveLink
//
//  Created by Ruben on 28/5/24.
//

import SwiftUI

struct ContentView: View {
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
            
            Button(action: { print("Login with email") }, label: {
                Label("Sign in with email", systemImage: "envelope.fill")
            })
            .tint(.black)
            .controlSize(.large)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .padding(.top, 60)
            
            Spacer()
            
            HStack {
                Button(action: { print("Register") }, label: {
                    Text("You do not have an account?")
                    Text("Sign up")
                        .underline()
                })
                .tint(.black)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
