//
//  DealView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/7/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//
import Foundation
import SwiftUI


struct DealView: View {
    
//    init() {
//    let navBarAppearance = UINavigationBar.appearance()
//    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//    
//    }
    @State var contentState = 0
    
    var body: some View {
        VStack {
            
            Picker(selection: self.$contentState, label: Text("Schedule State")) {
                Text("Sales").tag(0)
                Text("Coupon").tag(1)
                //Text("Activity").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            VStack {
                            Text("")
            }
        }
        .navigationBarTitle(Text("Deal").font(.subheadline), displayMode: .inline)
        

        
        //NavigationView {
//            VStack {
//                Text("copy the content to here")
//            }
//            .navigationBarTitle(Text("").font(.subheadline), displayMode: .inline)
            //.foregroundColor(.white)
//            .background(NavigationConfigurator { nc in
//                //nc.navigationBar.barTintColor = UIColor(red: 11, green: 105, blue: 15, alpha: 1)
//                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
//            })
        //}
    //.navigationViewStyle(DefaultNavigationViewStyle())
    }
    
    
    
}


struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}


struct DealView_Previews: PreviewProvider {
    static var previews: some View {
        DealView()
    }
}
