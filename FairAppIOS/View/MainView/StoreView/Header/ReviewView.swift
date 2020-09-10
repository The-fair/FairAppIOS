//
//  ReviewView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 9/9/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ReviewView: View {
    @State var review_list: [Review_Element] = []
    @Binding var isNavBarHidden: Bool
    
    var body: some View {
        VStack {
                    Text("review view")
        }
        .onAppear {
                self.isNavBarHidden = false
        }
        
    }

                
}

class Review_Element: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var reviewer: String = ""
    @Published var content: String = ""
}
