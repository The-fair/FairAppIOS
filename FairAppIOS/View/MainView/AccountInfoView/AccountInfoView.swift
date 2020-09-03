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
import FirebaseAuth

import Combine

let FILE_NAME = "User/tangmac@live.cn/portrait_image/portrait_image_test.jpeg"

struct AccountInfoView: View {
    @EnvironmentObject var session: AuthSessionStore
    
    @State var shown = false
    @State var imageURL = ""
    
    @State var firstName = ""
    @State var lastName = ""
    @State var emailAddr = ""
    
    @State var results = [VendorProfileHttpRequestResult]()
    
    
    var body: some View {
        
        return NavigationView {
            
            VStack(spacing: 30) {
                Group {
                    // Upload Image
                    HStack {
                        if imageURL != "" {
                           FirebaseImageView(imageURL: imageURL)
                        }
                        
                        Text(String((Auth.auth().currentUser?.email)!))
                    }

                     
                    
                    List {
                        NavigationLink(destination: AccountProfileView()) {
                            Text("Profile")
                        }
                        
                        NavigationLink(destination: BusinessInfoView()) {
                            Text("Business Info")
                        }
                        
                        NavigationLink(destination: AccountSecurityView()) {
                            Text("Security")
                        }
                        
                        NavigationLink(destination: AccountHelpFAQView()) {
                            Text("Help & FAQ")
                        }
                        
                        NavigationLink(destination: AccountNotificationView()) {
                            Text("Notification")
                        }
                    }   // List
                        .listStyle(GroupedListStyle())
                    
                    // Sign out
                    Button(action: session.signOut) {
                        Text("SignOut")
                     }
                .padding()
                }   // Group
                
            }
       
            
        }.onAppear(perform: loadData).animation(.spring())
    }
    
    // **************************************************
    //  load data including both imagre and info
    // **************************************************
    func loadData() {
        loadImageFromFirebase()
        //loadSampleDataFromGoogleCloud()
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

struct AccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoView().environmentObject(AuthSessionStore())
    }
}


