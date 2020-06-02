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
    
    @State var marketList: [String] = []
    @State var selectedMarket: String = ""
    
    @State var business: String = ""
    @State var businessAddr: String = ""
    
    let MarketList_Demo = ["Market_A", "Market_B", "Market_C", "Market_D", "Market_E", "Market_F", "Market_G", "Market_H", "Market_G"]
    
    
    // declare environment onbject session that could be shared through all the sub view
    @EnvironmentObject var session: SessionStore
    
    // **************************************************
    //  drop down list for attended market
    // **************************************************
    
    
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
                
                // email textfield
                TextField("Email", text: $email)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                // password textfield
                TextField("Password", text: $password)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                // first name textfield
                TextField("First Name", text: $firstName)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                // last name textfield
                TextField("Last Name", text: $lastName)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                // middle name textfield
                TextField("Middle Name", text: $middleName)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                LabelledDivider(label: "Your Business")
                
                // business textfield
                TextField("Your Business", text: $business)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                LabelledDivider(label: "Business Address")
                
                // business address
                TextField("Business Address", text: $businessAddr)
                .font(.system(size: 14))
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.black, lineWidth: 1))
                
                // stack for attended market
                //Text("Attened Market").font(.system(size: 18, weight: .medium)).foregroundColor(Color.gray)
                LabelledDivider(label: "Attended Market")

            }
            .padding(.horizontal,20)
            .padding(.vertical,40)
        }
        
    }
}

struct DropDown: View {
    @State var expand = false
    @State private var marketIndex = 0
    @State var marketList: [String] = []
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Picker(selection: $marketIndex, label: Text("Market")) {
                        ForEach(0 ..< marketList.count) {
                            Text(self.marketList[$0]).tag($0)
                        }
                    } // picker
                } // section
            }.navigationBarTitle((Text("Market")))
        } // navigation view
    }
}


// For preview usage
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
