//
//  ContentView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import SwiftUI


// this is the entrance of the app view
struct ContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    // **************************************************
    //  the function to get session user status
    // **************************************************
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome back user")
                Button(action: session.signOut) {
                    Text("SignOut")
                }
            }
            else {
                //Text("Show auth screen")
                AuthView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
