//
//  SignUpView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct SignUpView: View {
    
    // declare the local variables
    @State var firstName: String = ""
    @State var middleName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var entityName: String = "testname"
    @State var streetAddr: String = ""
    @State var zipCode: String = ""
    
    
    //@State var marketList: [String] = []
    @State private var marketList = ["Market_A", "Market_B", "Market_C", "Market_D", "Market_E", "Market_F", "Market_G", "Market_H", "Market_G"]
    @State var addedMarketList: [String] = []
    
    //@State private var selectedState: String = ""
    //@State private var selectedCity: String = ""
    //@State private var selectedMarket: String = ""
    @State private var showModal: Bool = false
    
    @State var business: String = ""
    
    @State var businessAddr_line1: String = ""
    @State var businessAddr_line2: String = ""
    @State var businessAddr_city: String = ""
    @State var businessAddr_state: String = ""
    
    
    @State var error: String = ""
    
    let MarketList_Demo = ["Market_A", "Market_B", "Market_C", "Market_D", "Market_E", "Market_F", "Market_G", "Market_H", "Market_G"]
    
    @State private var marketIndex_Demo = 0
    
    
    // declare environment onbject session that could be shared through all the sub view
    @EnvironmentObject var session: AuthSessionStore
    @Environment(\.presentationMode) var presentationMode:Binding<PresentationMode>
    //@EnvironmentObject var marketInfoBindings: MarketInfoBindings
    
    // **************************************************
    //  main bodhy of sign up view
    // **************************************************
    var body: some View {
        ScrollView(.vertical){
                // Main Stack
                    VStack {
                        Text("Fill In Your Account Information")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                        
                        Group {
                            LabelledDivider(label: "Personal Information")
                            
                            // email textfield
                            TextField("Email", text: $email)
                            .font(.system(size: 14))
                                .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            // password textfield
                            SecureField("Password", text: $password)
                            .font(.system(size: 14))
                                .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            // first name textfield
                            TextField("First Name", text: $firstName)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            // last name textfield
                            TextField("Last Name", text: $lastName)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
//                            // middle name textfield
//                            TextField("Middle Name", text: $middleName)
//                            .font(.system(size: 14))
//                            .autocapitalization(.none)
//                            .padding(12)
//                            .background(RoundedRectangle(cornerRadius: 25)
//                                .strokeBorder(Color.black, lineWidth: 1))
                        }
                        
                        Group {
                            LabelledDivider(label: "Your Business")
                            
                            // business textfield
                            TextField("Your Business", text: $business)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            LabelledDivider(label: "Business Address")
                            
                            // business address
                            TextField("Business Address Line#1", text: $businessAddr_line1)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            TextField("Business Address Line#2 (Optional)", text: $businessAddr_line2)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                            
                            HStack {
                                // business address
                                TextField("City", text: $businessAddr_city)
                                .font(.system(size: 14))
                                .autocapitalization(.none)
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                
                                TextField("State", text: $businessAddr_state)
                                .font(.system(size: 14))
                                .autocapitalization(.none)
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color.black, lineWidth: 1))
                            }
                            
                            TextField("Zip Code", text: $zipCode)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                        }
                        
                        Group {
                            Group {
                                LabelledDivider(label: "Create Account")
                                
                                // business textfield
                                // Add market button
                                VStack(alignment: .center, spacing: 10){
                                    Button(action: {
                                        self.signUpInFirebase() {
                                            self.signUpInServer() {
                                                
                                            }
                                        }
                                    }){
                                        Text("Create a new account for free")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                        .padding(12)
                                            //.multilineTextAlignment(.center)
                                            //.lineLimit(2)
                                            //.fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                    .padding()
//                                    .frame(minWidth: 0, maxWidth: .infinity)
//                                    .padding()
//                                    .foregroundColor(.white)
//                                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//                                    .cornerRadius(40)
                                    
                                    Button(action: {
                                        //self.showModal.toggle()
                                    }){
                                        Text("I already have an account")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                        .padding(12)
                                            //.multilineTextAlignment(.center)
                                            //.lineLimit(2)
                                        //.fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                    .padding()
//                                    .frame(minWidth: 0, maxWidth: .infinity)
//                                    .padding()
//                                    .foregroundColor(.white)
//                                    .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
//                                    .cornerRadius(40)
                                }
//                                .padding()
                                
                                // terms of use
                                Text("By Clicking on \"Create Account\" means you agree with our Terms of use")
                                .font(.system(size: 14))
                                .padding(5)
                            }
                    }
                } // scrollable view
                        .navigationBarTitle("Fill Your Information", displayMode: .inline)

            .padding(.horizontal, 20)
            .padding(.vertical, 20)}
            .sheet(isPresented: $showModal) {
                MarketSearchView(showModal: self.$showModal, addedMarketList: self.$addedMarketList)
        }
        
    }
    
    // **************************************************
    //  delete the market from the markey list
    // **************************************************
    func deleteMarketListItem(at offsets: IndexSet) {
        self.addedMarketList.remove(atOffsets: offsets)
    }
    
    // **************************************************
    //  drop down list for attended market
    // **************************************************
    func signUpInFirebase(CompletionHandler: @escaping () -> Void) {
        
        // register user information into firebase authentication
        session.signUp(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
                //print(error.localizedDescription)
            }
            else {
                //self.email = ""
                //self.password = ""
                CompletionHandler()
            }
            
        }
    }
    
    
    // **************************************************
    //  sign up into server
    // **************************************************
    func signUpInServer(CompletionHandler: @escaping () -> Void) {
        let urlString = NetworkConstants.DatabaseConstants.BaseIpAddr + NetworkConstants.DatabaseConstants.Colon + NetworkConstants.DatabaseConstants.PortNumber +  NetworkConstants.DatabaseConstants.ApiRoute + NetworkConstants.VendorCollectionConstants.BaseRoute + NetworkConstants.VendorCollectionConstants.AddNewVendorRoute
        
        guard let url = URL(string: urlString) else { return }
        
        let body: [String: String] = ["firstname": self.firstName, "lastname": self.lastName, "email": self.email, "pw": self.password, "entityName": self.entityName, "streetAddr": self.streetAddr, "city": self.businessAddr_city, "state": self.businessAddr_state, "zipCode": self.zipCode]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            print(data)
        }.resume()
    }
}

// For preview usage
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
