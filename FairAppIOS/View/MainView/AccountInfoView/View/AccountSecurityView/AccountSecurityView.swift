//
//  AccountSecurityView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/16/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct AccountSecurityView: View {
    
    @EnvironmentObject var session: AuthSessionStore
    
    let FILE_NAME = "User/tangmac@live.cn/portrait_image/portrait_image_test.jpeg"
    let SUCCESS_EMAIL_RESET = "We have just sent you a password reset email. Please check your inbox and follow the instruction to reset your password"
    
    @State var imageURL = ""
    @State var accountEmail = ""
    
    var body: some View {
        VStack {
            Group {
                VStack(spacing: 15) {
                    // display the image on the top
                    if imageURL != "" {
                        FirebaseImageView(imageURL: imageURL)
                    }
                }
                
                VStack {
                    Text("Email")
                    TextField("Email",text: self.$accountEmail)
                    .font(.system(size: 14))
                    .autocapitalization(.none)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(Color.black, lineWidth: 1))
                    .disabled(true)
                }
                
                Button(action: {
                    print("reset password")
                    self.resetPasswordOnTapped()
                }) {
                    Text("Reset Password")
                }
            }
        }
        .onAppear(perform: setAccountEmail)
    }   // body view
    
    // **************************************************
    //  set email
    // **************************************************
    func setAccountEmail() {
        self.accountEmail = Auth.auth().currentUser?.email! as! String
    }
    
    // **************************************************
    //  reset password action
    // **************************************************
    func resetPasswordOnTapped() {
        let email = self.accountEmail
        if email == "" {
            print("ERROR: Empty Email Reset")
        }
        
        self.resetPassword(email: email, onSucess: {
            print("Paaword Reset Successful")
        }) { (errorMessage) in
            print(errorMessage)
        }
    }
    
    // **************************************************
    //  reset password
    // **************************************************
    func resetPassword(email: String, onSucess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil {
                onSucess()
            }
            else {
                onError(error!.localizedDescription)
            }
        }
    }
}

struct AccountSecurityView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSecurityView()
    }
}
