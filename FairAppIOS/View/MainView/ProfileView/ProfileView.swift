//
//  ProfileView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/3/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseStorage
import Combine

let FILE_NAME = "User/tangmac@live.cn/portrait_image/portrait_image_test.jpeg"

struct ProfileView: View {
    @EnvironmentObject var session: AuthSessionStore
    
    @State var shown = false
    @State var imageURL = ""
    
    @State var firstName = ""
    @State var lastName = ""
    @State var emailAddr = ""
    
    @State var results = [VendorProfileHttpRequestResult]()
    
    
    var body: some View {
        VStack {
            // Upload Image
            if imageURL != "" {
                FirebaseImageView(imageURL: imageURL)
            }
            
            Button(action: { self.shown.toggle() }) {
                Text("Add Photo")
                    .font(.system(size: 14))
                    .bold()

            }
            .sheet(isPresented: $shown) {
                imagePicker(shown: self.$shown,imageURL: self.$imageURL)
                }
            .padding(10)
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(20)
            
            //Private info
            VStack {
                // title
                Text("Private Info")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                
                Group {
                    
                    // first name
                    VStack(spacing: 5) {
                        Text("First Name:")
                            .font(.system(size: 10))
                             .fontWeight(.semibold)
                             .foregroundColor(Color.black)
                             .multilineTextAlignment(.center)
                        // first name textfield
                        TextField("First Name", text: $firstName)
                        .font(.system(size: 14))
                            .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.black, lineWidth: 1))
                    }.padding()
                    
                    // last name
                    VStack(spacing: 5) {
                        Text("Last Name:")
                            .font(.system(size: 10))
                             .fontWeight(.semibold)
                             .foregroundColor(Color.black)
                             .multilineTextAlignment(.center)
                        // first name textfield
                        TextField("Last Name", text: $lastName)
                        .font(.system(size: 14))
                            .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.black, lineWidth: 1))
                    }.padding()
                    
                    // email
                    VStack(spacing: 5) {
                        Text("Email:")
                            .font(.system(size: 10))
                             .fontWeight(.semibold)
                             .foregroundColor(Color.black)
                             .multilineTextAlignment(.center)
                        // first name textfield
                        TextField("Email", text: $emailAddr)
                        .font(.system(size: 14))
                            .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 5)
                            .strokeBorder(Color.black, lineWidth: 1))
                    }.padding()
                    
                    
                    List(results, id: \.email) { item in
                        VStack(alignment: .leading) {
                            Text(item.firstname)
                                .font(.headline)
                            Text(item.lastname)
                        }
                    }
                    

                }
            }
            
            // Sign out
            Button(action: session.signOut) {
                Text("SignOut")
            }
            
        }.onAppear(perform: loadData).animation(.spring())
    }
    
    // **************************************************
    //  load data including both imagre and info
    // **************************************************
    func loadData() {
        loadImageFromFirebase()
        loadSampleDataFromGoogleCloud()
    }
    
    
    // **************************************************
    //  load image from the firebase storage
    // **************************************************
    func loadImageFromFirebase() {
        let storage = Storage.storage().reference(withPath: FILE_NAME)
        storage.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            print("Download success")
            self.imageURL = "\(url!)"
        }
    }
    
    // **************************************************
    //  load the data from the google cloud backend
    // **************************************************
    func loadSampleDataFromGoogleCloud() {
        
        let urlString = NetworkConstants.DatabaseConstants.BaseIpAddr + NetworkConstants.DatabaseConstants.Colon +
            NetworkConstants.DatabaseConstants.PortNumber + NetworkConstants.DatabaseConstants.ApiRoute + NetworkConstants.VendorCollectionConstants.BaseRoute + NetworkConstants.VendorCollectionConstants.GetVendorList
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                
                //print(data)
                
                if let decodedResponse = try? JSONDecoder().decode(VendorProfileHttpRequestResponse.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // display error message sent from the server or local unknown error
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


