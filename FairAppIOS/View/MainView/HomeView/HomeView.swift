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
    
    let ModuleIconPair = ["Schedule":"calendar",
                          "Product":"calendar",
                          "Deal":"calendar",
                          "Content":"calendar",
                          "Order":"calendar",
                          "Message":"calendar"]
    
    
    // binding environment object
    //let schedule_setting = Schedule_Setting()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                // first row stack
                HStack(spacing: 80) {
                    NavigationLink(destination: ScheduleView()) {

                        VStack {
                            Image(systemName: ModuleIconPair["Schedule"]!)
                            Text("Schedule")
                                .foregroundColor(Color.green)
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
//                    .background(NavigationConfigurator { nc in
//                        nc.navigationBar.barTintColor = .blue
//                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.green]
//                    })
                    
                    // product section button
                    NavigationLink(destination: ProductView()) {
                    //Button(action: self.navigateToProductView) {
                        VStack {
                            Image(systemName: ModuleIconPair["Product"]!)
                            Text("Product")
                            .foregroundColor(Color.green)
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
                            Image(systemName: ModuleIconPair["Deal"]!)
                            Text("Deal")
                            .foregroundColor(Color.green)
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
                        VStack {
                            Image(systemName: ModuleIconPair["Content"]!)
                            Text("Content")
                            .foregroundColor(Color.green)
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
                        VStack {
                            Image(systemName: ModuleIconPair["Order"]!)
                            Text("Order")
                            .foregroundColor(Color.green)
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                    
                    NavigationLink(destination: MessageView()) {
                        VStack {
                            Image(systemName: ModuleIconPair["Message"]!)
                            Text("Message")
                            .foregroundColor(Color.green)
                            .frame(width: 80, height: 20, alignment: .center)
                        }
                    }
                    .font(.system(size: 14))
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
                    .frame(width: 100, height: 100, alignment: .center))
                }.padding()
//                .background(NavigationConfigurator { nc in
//                    nc.navigationBar.barTintColor = .blue
//                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.green]
//                })
            } // main VStack
            .padding()
                //.navigationBarTitle("back", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor(red: 0.043, green: 0.4118, blue: 0.0588, alpha: 0.9)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white, .font : UIFont(name: "Georgia-Bold", size: 20)!]
                //nc.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            })

        }   // NavigationView
        .accentColor( .white)
        .navigationViewStyle(StackNavigationViewStyle())
        
    //.navigationViewStyle(StackNavigationViewStyle())

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
