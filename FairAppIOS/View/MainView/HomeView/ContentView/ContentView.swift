//
//  ContentView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/7/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("content")
    }
    
//    //@State var title: String
//    var storeElement: Store_Element = Store_Element()
//
//    func fetchContentByVendorID(vendorID: String)-> Bool {
//
//        self.contentElement.rating = 3
//        self.contentElement.title = "default title"
//        self.contentElement.descriptoon = "default description"
//
//        return true
//    }
//
//
//
//    var body: some View {
//        if (self.fetchContentByVendorID(vendorID: "0")) {
//            return AnyView(
//                StoreBaseView(contentElement: contentElement)
//            )
//        }
//        else {
//            //return AnyView(ProgressView())
//            return AnyView(ActivityIndicator(isAnimating: true) {
//                $0.color = .red
//                $0.hidesWhenStopped = false
//                //Any other UIActivityIndicatorView property you like
//            })
//        }
//
//    }
}

//struct StoreBaseView: View {
//
//    @State var contentElement: Store_Element
//
//    var body: some View {
//        Form {
//            StoreHeaderView(rating: self.contentElement.rating, title: self.contentElement.title, description: self.contentElement.descriptoon)
//        }
//    }
//}
//
//
//struct StoreHeaderView: View {
//    @State var rating: Int
//    @State var title: String
//    @State var description: String {
//        didSet {
//            print(self.description)
//        }
//    }
//
//
//    var body: some  View {
//        Section {
//            Text("\(self.title)")
//            RatingStar(rating: $rating)
//            TextField("", text: self.$description)
//        }
//    }
//}
//
//
//
//
//class Store_Element : ObservableObject, Identifiable {
//    @Published var id = UUID()
//    @Published var title: String = ""
//    @Published var rating: Int = 0
//    @Published var descriptoon: String = ""
//
//
////    init(day: String, switchState: Bool) {
////
////    }
//}
//
//
////class Content_Detail: ObservableObject {
////
////    @Published
////}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
