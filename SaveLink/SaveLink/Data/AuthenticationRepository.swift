//
//  AuthenticationRepository.swift
//  SaveLink
//
//  Created by Ruben on 31/5/24.
//

import Foundation

final class AuthenticationRepository {
    
    private let authenticationFirebaseDataSource: AuthenticationFirebaseDataSource
    
    init(authenticationFirebaseDataSource: AuthenticationFirebaseDataSource = AuthenticationFirebaseDataSource()) {
        self.authenticationFirebaseDataSource = authenticationFirebaseDataSource
    }
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDataSource.createNewUser(email: email,
                                                       password: password, 
                                                       completionBlock: completionBlock)
    }
    
    func getCurrentUser() -> User? {
        authenticationFirebaseDataSource.getCurrentUser()
    }
    
    func logout() throws {
        try authenticationFirebaseDataSource.logout()
    }
    
}
