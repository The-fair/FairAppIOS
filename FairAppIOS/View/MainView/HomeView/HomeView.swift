//
//  HomeView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/3/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                
                // first row stack
                HStack(spacing: 80) {
                    NavigationLink(destination: ScheduleView()) {
                    // schedule section button
                    //Button(action: self.navigateToScheduleView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Schedule")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                    
                    // product section button
                    NavigationLink(destination: ProductView()) {
                    //Button(action: self.navigateToProductView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Product")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                    
                }.padding()
                
                // second row stack
                HStack(spacing: 80) {
                    
                    // Deal Section Button
                    NavigationLink(destination: DealView()) {
                    //Button(action: self.navigateToDealView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Deal")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                        .font(.system(size: 14))
                        .padding(5)
                        .background(RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.black, lineWidth: 1)
                        .frame(width: 100, height: 100, alignment: .center))
                    }
                    
                    // Content section button
                    NavigationLink(destination: ContentView()) {
                    //Button(action: self.navigateToContentView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Content")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                    
                }.padding()
                
                // third row stack
                HStack(spacing: 80) {
                    
                    NavigationLink(destination: OrderView()) {
                    //Button(action: self.navigateToOrderView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Order")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                    
                    NavigationLink(destination: MessageView()) {
                    //Button(action: self.navigateToMessageView) {
                        VStack {
                            Image(systemName: "pencil")
                            Text("Message")
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                }.padding()
            } // main VStack
            .padding()
        }

    }
    
    // **************************************************
    // function to navigate to schedule view
    // **************************************************
    func navigateToScheduleView() {
        //ScheduleView()
    }
    
    // **************************************************
    // function to navigate to product view
    // **************************************************
    func navigateToProductView() {
        //ProductView()
    }
    
    // **************************************************
    // function to navigate to deal view
    // **************************************************
    func navigateToDealView() {
        //DealView()
    }
    
    // **************************************************
    // function to navigate to content view
    // **************************************************
    func navigateToContentView() {
        //ContentView()
    }
    
    // **************************************************
    // function to navigate to order view
    // **************************************************
    func navigateToOrderView() {
        //OrderView()
    }
    
    // **************************************************
    // function to navigate to message view
    // **************************************************
    func navigateToMessageView() {
        //MessageView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
