//
//  AuthView.swift
//  FairAppIOS
//
//  Created by Mengtao Tang on 6/1/20.
//  Copyright © 2020 Mo's Company. All rights reserved.
//

import Foundation
import SwiftUI

struct AuthView: View {
    var body: some View {
        NavigationView {
            SignInView()
        }
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
