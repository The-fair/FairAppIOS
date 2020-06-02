//
//  SessionStore.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    
    // declare a session that publish itself on change
    @Published var session: User? {
        didSet {
            self.didChange.send(self)
        }
    }
    
    var handle: AuthStateDidChangeListenerHandle?
    
    // **************************************************
    //  function to be called when the auth state changed
    // **************************************************
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = User(uid: user.uid, email: user.email)
            }
            else {
                self.session = nil
            }
        })
    }
    
    // **************************************************
    //  sign up using firebase api
    // **************************************************
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    // **************************************************
    //  sign in using firebase api
    // **************************************************
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    // **************************************************
    //  sign out from the current user
    // **************************************************
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = nil
        }
        catch {
            print("[Model/AuthSession/SessionStore.swift] : Error signing out")
        }
    }
    
    // **************************************************
    //  unbind
    // **************************************************
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}



// *********************************
//  structure that store user info
// *********************************
struct User {
    var uid: String
    var email: String?
    
    init(uid: String, email: String?) {
        self.uid = uid
        self.email = email
    }
}
