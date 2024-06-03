//
//  AuthenticationFirebaseDataSource.swift
//  SaveLink
//
//  Created by Ruben on 31/5/24.
//

import Foundation
import FirebaseAuth


struct User {
    let email: String
}

final class AuthenticationFirebaseDataSource {
    
    func createNewUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creating user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "no email"
            print("New user create with email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
}
