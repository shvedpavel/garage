//
//  AuthService.swift
//  garage
//
//  Created by Apple on 5.12.23.
//

import Foundation
import Firebase
import FirebaseAuth



protocol AuthService: AnyObject {
    func signIn(with email: String, password: String, completion: @escaping (Result<User, Error>) -> ())
}

class AuthServiceImpl: AuthService {

    func signIn(with email: String, password: String, completion: @escaping (Result<User, Error>) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { responce, error in
            if let error = error as? NSError {
                completion(.failure(error))
            } else if let responce = responce,
                      let email = responce.user.email {
                completion(.success(User(email: email, name: responce.user.displayName ?? "no name")))
            }
        }
    }
//    var authStateDidChangeListenerHandle: AuthStateDidChangeListenerHandle!
    
    
//    Auth.auth().removeStateDidChangeListener(authStateDidChangeListenerHandle)
//    
//    private func stateDidChangeListenerHandle() {
//           authStateDidChangeListenerHandle = Auth.auth().addStateDidChangeListener({ [ weak self ] _, user in
//               guard let _ = user else { return }
//           })
//       }
}
