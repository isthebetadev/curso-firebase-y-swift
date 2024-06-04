//
//  HomeView.swift
//  SaveLink
//
//  Created by Ruben on 3/6/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var linkViewModel: LinkViewModel = LinkViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let email = authenticationViewModel.user?.email {
                    Text("Bienvenido \(email)")
                }
                Spacer()
                LinkView(linkViewModel: linkViewModel)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                Button(action: { authenticationViewModel.logout() }, label: {
                    Text("Logout")
                })
            }
        }
    }
}

#Preview {
    HomeView(authenticationViewModel: .init())
}
