//
//  PreLogin.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/13/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI


struct PreLoginView: View {
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Image view
                Image("user")
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .clipped()
                
                // subtitle
                Text("Unlock the fresh world around")
                
                
                // Button group
                Group {
                    // Login button
                    NavigationLink(destination: SignInView()){
                        ZStack {
                            Text("Sign in")
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .frame(width: 200, height: 50)
                        }
                    }
                    //.background(RoundedRectangle(cornerRadius: 25)
                    //.strokeBorder(Color.black, lineWidth: 1))
                    .background(Color.green)
                    .cornerRadius(25)
                    .padding()
                    
                    
                    
                    // Sign up button
                    NavigationLink(destination: SignUpView()){
                        ZStack {
                            Text("Sign up")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .frame(width: 200, height: 50)
                        }

                    }
                    //.background(RoundedRectangle(cornerRadius: 25)
                    //.strokeBorder(Color.black, lineWidth: 1))
                    .background(Color.green)
                    .cornerRadius(25)
                    .padding()
                }
                
            }
        }
    }
}


struct PreLoginView_Previews: PreviewProvider {
    //@Binding var selectedState: String
    //@Binding var selectedCity: String
    //@Binding var selectedMarket: String
    
    static var previews: some View {
        //MarketSearchView(selectedState: self.$selectedState, selectedCity: self.$selectedCity, selectedMarket: self.$selectedMarket)
        //MarketSearchView(showModal: .constant(true), selectedState: .constant(""), selectedCity: .constant(""), selectedMarket: .constant(""), addedMarketList: .constant([]))
        PreLoginView()
    }
}
