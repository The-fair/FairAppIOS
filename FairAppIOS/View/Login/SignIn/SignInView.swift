//
//  SignInView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI


struct SignInView: View {
    
    // declare on change variable
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    // declare environment onbject session that could be shared through all the sub view
    @EnvironmentObject var session: AuthSessionStore
    
    
    // **************************************************
    //  sign in function using firebase auth
    // **************************************************
    func signInWithFirebase() {
        //print("[View/Login/AuthView]: email=> \(email) password=> \(password)")
        
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    // **************************************************
    //  sign in function using google auth
    // **************************************************
    func signInWithGoogle() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    // **************************************************
    //  sign in function using facebook auth
    // **************************************************
    func signInWithFacebook() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            }
            else {
                self.email = ""
                self.password = ""
            }
        }
    }
    
    // **************************************************
    //  handle forget password
    // **************************************************
    func handleForgetPassword() {
        // do nothing
        print("[View/Login/AuthView.swift]: forgetPassword")
    }
    
    // **************************************************
    //  create the view
    // **************************************************
    var body: some View {
        
        // Main Contrainer
        VStack(spacing: 20) {
            Text("Welcom Back!").font(.system(size: 32, weight: .heavy))
            
            //Text("Sign in to container").font(.system(size: 18, weight: .medium)).foregroundColor(Color.gray)
            
            VStack(spacing: 18) {
                // email Input Text Field
                TextField("Email address", text: $email)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color.black, lineWidth: 1))
                
                // password input text field
                SecureField("Password", text: $password)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color.black, lineWidth: 1))
                
                Button(action: signInWithFirebase) {
                    Text("Login")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                }
            }
            .padding(.vertical, 25)
            
            
            LabelledDivider(label: "or")
            
            // Optional Sign In Button
            HStack(spacing: 18) {
                Button(action: signInWithGoogle) {
                    Text("Sign In With Google")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                }
                
                Button(action: signInWithFacebook) {
                    Text("Sign In With Google")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(25)
                }
                
            }.padding(.horizontal, 20)
            
            Button(action: handleForgetPassword) {
                Text("Forget Password?").frame(minWidth: 0, maxWidth: .infinity).frame(height: 50).foregroundColor(.green).font(.system(size: 16, weight: .bold))
            }
            
            if (error != "") {
                Text(error).font(.system(size: 14, weight: .semibold)).foregroundColor(.red).padding()
            }
            
            Spacer()
            
            NavigationLink(destination: SignUpView()) {
                HStack {
                    Text("I am a new user ")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(.primary)
                    
                    Text("Create an account")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.blue)
                }
            }
            
        }
        .padding(.horizontal,20)
    }
}
