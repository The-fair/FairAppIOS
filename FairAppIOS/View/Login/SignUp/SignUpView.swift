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
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = "123456"
    
    
    //@State var marketList: [String] = []
    @State private var marketList = ["Market_A", "Market_B", "Market_C", "Market_D", "Market_E", "Market_F", "Market_G", "Market_H", "Market_G"]
    @State var addedMarketList: [String] = []
    
    //@State private var selectedState: String = ""
    //@State private var selectedCity: String = ""
    //@State private var selectedMarket: String = ""
    @State private var showModal: Bool = false
    
    @State var business: String = ""
    @State var businessAddr: String = ""
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
                            
                            // middle name textfield
                            TextField("Middle Name", text: $middleName)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
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
                            TextField("Business Address", text: $businessAddr)
                            .font(.system(size: 14))
                            .autocapitalization(.none)
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 25)
                                .strokeBorder(Color.black, lineWidth: 1))
                        }

                        
                        // stack for attended market
                        //Text("Attened Market").font(.system(size: 18, weight: .medium)).foregroundColor(Color.gray)
                        
                        Group {
                            LabelledDivider(label: "Market")
                            
                            VStack(spacing: 5) {
                                //ScrollView{
                                    List {
                                        ForEach(addedMarketList, id: \.self) { market in
                                            //Text(self.marketList[$0]).tag($0)
                                            Text(market)
                                                .foregroundColor(.black)
                                                .font(.system(size: 14))
                                                .padding(5)
                                                .frame(width: 250)
                                            .background(RoundedRectangle(cornerRadius: 25)
                                            .strokeBorder(Color.black, lineWidth: 1))
                                        }
                                        .onDelete(perform: deleteMarketListItem)

                                        }
                                    .frame(minHeight: 100, maxHeight: 200.0)

                                Spacer()
                                
                                // Add market button
                                Button(action: {
                                    self.showModal.toggle()
                                }){
                                    Image(systemName: "plus.circle")
                                        .font(.title)
                                        .foregroundColor(.green)
                                    
                                    Text("Add Market")
                                        .fontWeight(.semibold)
                                        .font(.body)
                                }.frame(width: 300)
                                    
                            }
                            
                            Group {
                                LabelledDivider(label: "Create Account")
                                
                                // business textfield
                                // Add market button
                                HStack{
                                    Button(action: {
                                        self.signUpInFirebase() {
                                            //self.presentationMode.wrappedValue.dismiss()
                                            self.signUpInServer() {
                                                
                                            }
                                        }
                                    }){
                                        Text("Create a new account for free")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                    }
                                    .background(RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                    
                                    Button(action: {
                                        //self.showModal.toggle()
                                    }){
                                        Text("I already have an account")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 14))
                                    }
                                    .background(RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(Color.black, lineWidth: 1))
                                }
                                
                                
                                // terms of use
                                Text("Terms of use")
                                .font(.system(size: 14))
                                .padding(5)
                            }
                    }
                } // scrollable view

            .padding(.horizontal,20)
            .padding(.vertical,20)}
            .sheet(isPresented: $showModal) {
                //MarketSearchView(showModal: self.$showModal, selectedState: self.$selectedState, selectedCity: self.$selectedCity, selectedMarket: self.$selectedMarket, addedMarketList: self.$addedMarketList)
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
        
        let body: [String: String] = ["firstname": self.firstName, "lastname": self.lastName, "email": self.email, "pw": self.password, "entityName": self.entityName, "streetAddr": self.streetAddr, "city": self.city, "state": self.state, "zipCode": self.zipCode]
        
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
