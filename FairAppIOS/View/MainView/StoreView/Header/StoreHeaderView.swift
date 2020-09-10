//
//  StoreHeaderView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 9/9/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct StoreHeaderView: View {
    @Binding var isNavBarHidden: Bool
    @State var rating: Int
    @State var title: String
    @State var description: String {
        didSet {
            print(self.description)
        }
    }
    
    
    var body: some View {
        Section(header:Text("")) {
            // title
            Text("\(self.title)")
            
            // poster
            Image(systemName: "photo")
                .resizable()
                .frame(height: 200)
            
            // rating
            RatingStar(rating: $rating)
            
            // review
            NavigationLink(destination: ReviewView(isNavBarHidden: self.$isNavBarHidden)) {
               Text("Review")
            }
            //.buttonStyle(PlainButtonStyle())
            
            // description
            TextField("", text: self.$description)
        }
    }
}
