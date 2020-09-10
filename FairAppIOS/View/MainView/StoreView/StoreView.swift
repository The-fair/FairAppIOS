//
//  StoreView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/3/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct StoreView: View {
    
    var contentElement: Store_Element = Store_Element()
    
    func fetchStoreInfoByVendorID(vendorID: String)-> Bool {
        
        self.contentElement.rating = 3
        self.contentElement.title = "default title"
        self.contentElement.descriptoon = "default description"
        
        return true
    }
    
    
    
    var body: some View {
        if (self.fetchStoreInfoByVendorID(vendorID: "0")) {
            return AnyView(
                StoreBaseView(contentElement: contentElement)
            )
        }
        else {
            //return AnyView(ProgressView())
            return AnyView(ActivityIndicator(isAnimating: true) {
                $0.color = .red
                $0.hidesWhenStopped = false
                //Any other UIActivityIndicatorView property you like
            })
        }
        
    }
}

struct StoreBaseView: View {
    
    @State var contentElement: Store_Element
    @State var isNavBarHidden: Bool = true
    
    var body: some View {
        NavigationView {
            Form {
                StoreHeaderView(isNavBarHidden: self.$isNavBarHidden, rating: self.contentElement.rating, title: self.contentElement.title, description: self.contentElement.descriptoon)
                StoreScheduleView()
                StoreActivityView()
                StoreOfferringView()
                StoreRecommendView()
                
            }
            .navigationBarTitle("Store")
            .navigationBarHidden(self.isNavBarHidden)
            .onAppear {
                    self.isNavBarHidden = true
            }
        }
    //.labelsHidden()


    }
}







class Store_Element : ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var title: String = ""
    @Published var rating: Int = 0
    @Published var descriptoon: String = ""
    
    
//    init(day: String, switchState: Bool) {
//
//    }
}







//class Content_Detail: ObservableObject {
//
//    @Published
//}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
