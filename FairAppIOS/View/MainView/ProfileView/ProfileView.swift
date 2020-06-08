//
//  ProfileView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/3/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct ProfileView: View {
        @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Button(action: session.signOut) {
            Text("SignOut")
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
