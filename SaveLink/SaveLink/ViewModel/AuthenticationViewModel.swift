//
//  AuthenticationViewModel.swift
//  SaveLink
//
//  Created by Ruben on 31/5/24.
//

import Foundation

final class AuthenticationViewModel {
    
    private let authenticationRepository: AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
    }
    
    func createNewUser(email: String, password: String) {
        
    }
    
}
