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
    @State var review_list: [Review_Element] = [
        Review_Element(reviewer: "A", content: "hahaha"),
        Review_Element(reviewer: "B", content: "hahaha"),
        Review_Element(reviewer: "C", content: "hahaha"),
    
    ]
    @Binding var isNavBarHidden: Bool
    
    //private var reviewList: [Review_Element]
    
    var body: some View {
        VStack {
                    Text("review view")
        }
        .onAppear {
                self.isNavBarHidden = false
        }
        
    }

                
}

//struct ReviewDetailView: View {
//    @State var review_element: Review_Element
//}

class Review_Element: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var reviewer: String = ""
    @Published var content: String = ""
    @Published var date: Date = Date()
    
    init(reviewer: String, content: String) {
        self.reviewer = reviewer
        self.content = content
    }
}
