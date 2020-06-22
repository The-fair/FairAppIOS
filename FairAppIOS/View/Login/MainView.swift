//
//  ContentView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI


// this is the entrance of the app view
struct MainView: View {
    
    @EnvironmentObject var session: AuthSessionStore
    
    // **************************************************
    //  the function to get session user status
    // **************************************************
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Home")
                        }

                    StoreView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Store")
                        }
                    
                    AccountInfoView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Profile")
                        }
                }
                
                /*
                Text("Welcome back user")
                Button(action: session.signOut) {
                    Text("SignOut")
                }
                */
            }
            else {
                //Text("Show auth screen")
                //AuthView()
                PreLoginView()
            }
        }.onAppear(perform: getUser)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        //MainView().environmentObject(AuthSessionStore())
        PreLoginView()
    }
}
