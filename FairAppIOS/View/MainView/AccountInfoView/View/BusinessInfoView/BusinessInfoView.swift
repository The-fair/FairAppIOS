//
//  BusinessInfoView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/16/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI

struct BusinessInfoView: View {
    
    @EnvironmentObject var session: AuthSessionStore
    let FILE_NAME = "User/tangmac@live.cn/portrait_image/portrait_image_test.jpeg"
    
    @State var imageURL = ""
    @State var businessName = ""
    @State var businessAddrLineOne = ""
    @State var businessAddrLineTwo = ""
    @State var city = ""
    @State var state = ""
    @State var zipCode = ""
    @State var businessEmail = ""
    @State var businessPhoneNumber = ""
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            Group {
                VStack(spacing: 15) {
                    // display the image on the top
                    if imageURL != "" {
                        FirebaseImageView(imageURL: imageURL)
                    }
                    
                }
                
                VStack(spacing: 15) {
                    
                    // business name
                    VStack {
                        Text("Business Name:")
                        TextField("Business Name", text: self.$businessName)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color.black, lineWidth: 1))
                    }
                    
                    // business address
                    VStack {
                        Text("Business Address:")
                        
                        TextField("Line#1", text: self.$businessAddrLineOne)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color.black, lineWidth: 1))
                        
                        TextField("Line#2", text: self.$businessAddrLineTwo)
                        .font(.system(size: 14))
                        .autocapitalization(.none)
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 25)
                            .strokeBorder(Color.black, lineWidth: 1))
                        
                        HStack {
                            Text("City")
                            TextField("City", text: self.$city)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            Text("State")
                            TextField("State", text: self.$state)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                        }
                        HStack {
                            Text("Zip Code")
                            TextField("Zip Code", text: self.$zipCode)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(5)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                        }
                    }   // business address VStack
                    
                    //business email
                    VStack {
                        Text("Business Email")
                        TextField("Business Email", text: self.$businessEmail)
                        Text("Business Phone number")
                        TextField("Business Phone Number", text: self.$businessPhoneNumber)
                        
                    }
                    
                    // attend market
                    
                    // Save the changes
                    VStack {
                        // save the change
                        Button(action: {
                            print("Save")
                        }) {
                            Text("Save")
                        }
                        
                        // reload with the original data
                        Button(action: {
                            print("Cancel")
                        }) {
                            Text("Cancel")
                        }
                        
                        
                    }
                }
            }
        }
    }
}

struct BusinessInfoView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessInfoView()
    }
}
